//
//  BikeStationViewModel.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/24/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import RxSwift
import Combine

class BikeStationViewModel: ObservableObject, GMUClusterMapper {
    
    var cluster: ClusterItem? = nil
    @Published var name: String = ""
    @Published var capacity: String = ""
    @Published var location: LocationCordinate
    
    private var id: String

    let model: BikeStationEntity
    
    
    init(station model: BikeStationEntity, useCase : UseCase? = nil) {
        self.model = model
        location = model.geocodedColumn
        name = model.name
        capacity = model.capacity
        id = model.id
        cluster = AnyGMUClusterItem(id: model.id, title: model.name, snippet: model.capacity, position: model.geocodedColumn)
    }
    
    
}
