//
//  GoogleMapViewFactory.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import GoogleMapsUtils
import GoogleMaps

struct GoogleMapClusteringFactory {
    
    static func createGridCluster(for map: GMSMapView) -> GMUClusterManager {
        
        let algorithm = GMUGridBasedClusterAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: map, clusterIconGenerator: GMUDefaultClusterIconGenerator())
        
        return GMUClusterManager(map: map, algorithm: algorithm, renderer: renderer)
        
    }
    
    #if DEBUG
    static func createSimpleCluster(for map: GMSMapView) -> GMUClusterManager {
        let algorithm = GMUSimpleClusterAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: map, clusterIconGenerator: GMUDefaultClusterIconGenerator())
        
        return GMUClusterManager(map: map, algorithm: algorithm, renderer: renderer)
    }
    #endif
    
    static func createNonHierarchicalCluster(for map: GMSMapView) -> GMUClusterManager {
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: map, clusterIconGenerator: GMUDefaultClusterIconGenerator())
        
        return GMUClusterManager(map: map, algorithm: algorithm, renderer: renderer)
    }
    
}
