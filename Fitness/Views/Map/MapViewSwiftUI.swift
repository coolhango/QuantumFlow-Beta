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
import CoreLocation
import MapKit

@available(iOS 17.0, *)
struct MapViewSwiftUI: View {
    let mapType: MapType
    let startLocation: CLLocation?
    let route: [CLLocation]
    let endLocation: CLLocation?
    @State private var position: MapCameraPosition

    init(mapType: MapType, startLocation: CLLocation?,
         route: [CLLocation], endLocation: CLLocation?) {
        self.mapType = mapType
        self.startLocation = startLocation
        self.route = route
        self.endLocation = endLocation
        self._position = .init(
            wrappedValue: mapType == .moving ? .userLocation(fallback: .automatic) : .automatic)
    }

    var body: some View {
        Map(position: $position,
            bounds: MapCameraBounds(minimumDistance: 3000,
                                    maximumDistance: 3000)) {
            if startLocation != nil {
                Annotation("Start",
                           coordinate: startLocation?.coordinate ?? CLLocationCoordinate2D()) {
                    ZStack {
                        Image("start")
                            .resizable()
                            .background(.black)
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay { Circle().stroke(.white, lineWidth: 2) }
                    }
                    .frame(width: 25)
                }
               .annotationTitles(.hidden)
            }
            MapPolyline(coordinates: route.map{ $0.coordinate })
                .stroke(Color(UIColor.orange), lineWidth: 5)
            if endLocation != nil {
                Annotation("Finish",
                           coordinate: endLocation?.coordinate ?? CLLocationCoordinate2D()) {
                    ZStack {
                        Image("finish")
                            .resizable()
                            .background(.gray)
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay { Circle().stroke(.black, lineWidth: 2) }
                    }
                    .frame(width: 25)
                }
               .annotationTitles(.hidden)
            }
        }
        .cornerRadius(10)
        .padding(.vertical)
        .opacity(0.7)
        .onChange(of: route) {
            if mapType == .moving {
                position = .userLocation(fallback: .automatic)
            }
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        return MapViewSwiftUI(
            mapType: .moving,
            startLocation: PersistenceController.mockCoords.first,
            route: PersistenceController.mockCoords,
            endLocation: PersistenceController.mockCoords.last)
    } else {
        return EmptyView()
    }
}
