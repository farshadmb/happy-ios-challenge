//
//  GoogleMapView.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import SwiftUI
import GoogleMaps
import CoreLocation
import GoogleMapsUtils

struct GoogleMapAdapterView: UIViewRepresentable {
    
    typealias ClusterItem = GMUClusterItem
    
    typealias UIViewType = GMSMapView
    
    private static let defaultCamera = GMSCameraPosition.camera(withLatitude: -37.8136, longitude: 144.9631, zoom: 10.0)
    
    private let mapView : GMSMapView
    
    private let manager : GMUClusterManager
    
    private weak var delegate: GMUClusterManagerDelegateWrapper?
    
    
    init(handler: @escaping(GMUClusterItem) -> () = { _ in }) {
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GoogleMapAdapterView.defaultCamera)
        mapView.isMyLocationEnabled = true 
        self.mapView = mapView
        self.manager = GoogleMapClusteringFactory.createGridCluster(for: mapView)
        
        self.delegate = GMUClusterManagerDelegateWrapper(itemHandler: handler, clusterHadler: { (cluster) in
            
        })
        
        self.manager.setDelegate(self.delegate, mapDelegate: nil)
    }
    
    /// Creates a `UIView` instance to be presented.
    func makeUIView(context: Self.Context) -> GMSMapView {
        return mapView
    }

    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        
        
    }
    
    
    func update(items: Binding<[ClusterItem]>) -> some View {
        // Creates a marker in the center of the map.
        self.manager.clearItems()
        self.manager.add(items.wrappedValue)
        self.manager.cluster()
        return self
    }
    
    func update(cameraPosition: GMSCameraPosition) -> some View {
        mapView.animate(to: cameraPosition)
        return self
    }
    
    func update(zoom level: Float) -> some View {
        mapView.animate(toZoom: level)
        return self
    }
    
    
}

struct GoogleMapView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapAdapterView()
    }
}
