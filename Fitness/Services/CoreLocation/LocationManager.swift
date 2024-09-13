// Copyright © 2024 Gedeon Koh All rights reserved.
// No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the publisher, except in the case of brief quotations embodied in reviews and certain other non-commercial uses permitted by copyright law.
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// Use of this program for pranks or any malicious activities is strictly prohibited. Any unauthorized use or dissemination of the results produced by this program is unethical and may result in legal consequences.
// This code has been tested throughly. Please inform the operator or author if there is any mistake or error in the code.
// Any damage, disciplinary actions or death from this material is not the publisher's or owner's fault.
// Run and use this program this AT YOUR OWN RISK.
// Version 0.1

// This Space is for you to experiment your codes
// Start Typing Below :) ↓↓↓

import Foundation
import CoreLocation
import Combine

@MainActor
final class LocationManager: NSObject, ObservableObject {
    private let locationManager: CLLocationManager
    private var isRecording = false
    var previousLocation: CLLocation?
    @Published var locationAccessIsDenied: Bool = false
    @Published var locationAccessThrowsError: Bool = false
    @Published var locationAccessError = ""
    @Published var locations: [CLLocation] = []
    @Published var distances: [Measurement<UnitLength>] = []
    @Published var speeds: [Measurement<UnitSpeed>] = []
    @Published var altitudes: [Measurement<UnitLength>] = []
    var startLocation: CLLocation? { locations.first }
    @Published var endLocation: CLLocation?
    @Published var totalDistance: CLLocationDistance = 0
    var distancePublisher: AnyPublisher<Measurement<UnitLength>, Never> {
        $distances.flatMap { distances in distances.publisher }.eraseToAnyPublisher()
    }
    var speedPublisher: AnyPublisher<Measurement<UnitSpeed>, Never> {
        $speeds.flatMap { speeds in speeds.publisher }.eraseToAnyPublisher()
    }
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.activityType = .fitness
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        if locationManager.authorizationStatus == .notDetermined {
            locationAccessIsDenied = true
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func startLocationServices() {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            isRecording = true
            locationManager.startUpdatingLocation()
        }
    }

    func stopLocationServices() {
        isRecording = false
        locationManager.stopUpdatingLocation()
        endLocation = locations.last
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            locationAccessIsDenied = false
            if isRecording {
                locationManager.startUpdatingLocation()
            }
        } else {
            locationAccessIsDenied = true
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.first else { return }
        self.locations.append(latest)
        if previousLocation == nil {
            previousLocation = latest
            distances.append(Measurement.init(value: 0, unit: UnitLength.meters))
        } else {
            let distance = previousLocation?.distance(from: latest) ?? 0
            totalDistance += distance
            distances.append(Measurement.init(value: self.totalDistance, unit: UnitLength.meters))
            previousLocation = latest
        }
        speeds.append(Measurement.init(value: latest.speed, unit: UnitSpeed.metersPerSecond))
        altitudes.append(Measurement.init(value: latest.altitude, unit: UnitLength.meters))
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let clError = error as? CLError else { return }
        switch clError {
        case CLError.denied:
            locationAccessIsDenied = true
        case CLError.promptDeclined:
            locationAccessIsDenied = true
        default:
            locationAccessThrowsError = true
            locationAccessError = clError.localizedDescription
      }
    }
}
