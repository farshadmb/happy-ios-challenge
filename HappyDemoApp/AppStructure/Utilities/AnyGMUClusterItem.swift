//
//  AnyGMUClusterItem.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/24/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import GoogleMapsUtils

@objc
class AnyGMUClusterItem : NSObject, ClusterItem, Identifiable {
    
    var id: String
    var position: CLLocationCoordinate2D
    var title: String?
    var snippet: String?
    
    init(id: String, title: String, snippet: String?, position: LocationCordinate) {
        self.id = id
        self.title = title
        self.snippet = snippet
        self.position = CLLocationCoordinate2D(latitude: position.lat, longitude: position.long)
    }
    
}
