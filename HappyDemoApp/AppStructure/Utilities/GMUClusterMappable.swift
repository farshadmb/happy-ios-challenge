//
//  GMUClusterMappable.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/24/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import GoogleMapsUtils

typealias ClusterItem = GMUClusterItem

protocol GMUClusterMapper {
    
    var cluster: ClusterItem? { get }
    
}
