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

import SwiftUI
import MapKit

struct MapViewUIKit: View {
    let mapType: MapType
    let startLocation: CLLocation?
    let route: [CLLocation]
    let endLocation: CLLocation?
    
    var body: some View {
        MapViewUI(mapType: mapType,
                  startLocation: startLocation,
                  endLocation: endLocation,
                  route: route)
        .cornerRadius(10)
        .padding(.vertical)
        .opacity(0.7)
    }
}

struct MapViewUI: UIViewRepresentable {
    let mapView = MKMapView()
    let mapType: MapType
    let regionRadius: CLLocationDistance = 1500
    var startLocation: CLLocation?
    var endLocation: CLLocation?
    var route: [CLLocation]

    func makeUIView(context: UIViewRepresentableContext<MapViewUI>) -> MKMapView {
        let region = getRouteCenterRegion(mapView: mapView)
        mapView.setRegion(region, animated: false)
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.isRotateEnabled = true
        mapView.isZoomEnabled = false
        mapView.delegate = context.coordinator
        mapView.register(LocationAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        if let startPoint { mapView.addAnnotation(startPoint) }
        if let endPoint { mapView.addAnnotation(endPoint) }
        mapView.addOverlay(polyline)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapViewUI>) {
        let region = getRouteCenterRegion(mapView: uiView)
        uiView.setRegion(region, animated: false)
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
        if let startPoint { uiView.addAnnotation(startPoint) }
        if let endPoint { uiView.addAnnotation(endPoint) }
        uiView.addOverlay(polyline)
    }

    func makeCoordinator() -> MapCoordinator {
        .init(self)
    }

    private func getRouteCenterRegion(mapView: MKMapView) -> MKCoordinateRegion {
        let approximateRouteCenterLatitude = ((endLocation?.coordinate.latitude ?? 0) + (startLocation?.coordinate.latitude ?? 0)) / 2
        let approximateRouteCenterLongitude = ((endLocation?.coordinate.longitude ?? 0) + (startLocation?.coordinate.longitude ?? 0)) / 2
        let routeCenterLocation = CLLocationCoordinate2D(
            latitude: approximateRouteCenterLatitude,
            longitude: approximateRouteCenterLongitude)
        switch mapType {
        case .stationary:
            return MKCoordinateRegion(
                center: routeCenterLocation,
                latitudinalMeters: regionRadius,
                longitudinalMeters: regionRadius)
        case .moving:
            return MKCoordinateRegion(
                center: mapView.userLocation.coordinate,
                latitudinalMeters: regionRadius,
                longitudinalMeters: regionRadius)
        }
    }
}

extension MapViewUI {
    var startPoint: MKPointAnnotation? {
        if let startLocation {
            let startAnnotation = MKPointAnnotation()
            startAnnotation.title = "Start"
            startAnnotation.coordinate = startLocation.coordinate
            return startAnnotation
        }
        return nil
    }
    var endPoint: MKPointAnnotation? {
        if let endLocation {
            let endAnnotation = MKPointAnnotation()
            endAnnotation.title = "Finish"
            endAnnotation.coordinate = endLocation.coordinate
            return endAnnotation
        }
        return nil
    }
    var polyline: MKPolyline {
        MKPolyline(
            coordinates: route.map { $0.coordinate },
            count: route.count)
    }
}

#Preview {
    MapViewUIKit(
        mapType: .stationary,
        startLocation: PersistenceController.mockCoords.first,
        route: PersistenceController.mockCoords,
        endLocation: PersistenceController.mockCoords.last)
}
