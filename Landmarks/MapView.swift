//
//  MapView.swift
//  Landmarks
//
//  Created by Alex Paul on 6/4/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : View, UIViewRepresentable {
  func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    let coordinate = CLLocationCoordinate2D(
      latitude: 34.011286, longitude: -116.166868)
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    view.setRegion(region, animated: true)
  }
  
  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: CGRect.zero)
  }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
