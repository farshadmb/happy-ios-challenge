//
//  GMUClusterManagerDelegateWrapper.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import GoogleMapsUtils

@objc
class GMUClusterManagerDelegateWrapper: NSObject, GMUClusterManagerDelegate {
    
    let itemHandler: (GMUClusterItem) -> Void
    let clusterHadler: (GMUCluster) -> Void
    
    deinit {
        
    }
    
    required init(itemHandler:@escaping (GMUClusterItem) -> Void, clusterHadler:@escaping (GMUCluster) -> Void) {
        self.itemHandler = itemHandler
        self.clusterHadler = clusterHadler
        super.init()
    }
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        clusterHadler(cluster)
        return true
    }
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap clusterItem: GMUClusterItem) -> Bool {
        itemHandler(clusterItem)
        return false
    }
}
