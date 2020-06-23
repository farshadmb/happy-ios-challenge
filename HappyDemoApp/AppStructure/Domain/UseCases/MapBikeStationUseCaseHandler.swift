//
//  MapBikeStationUseCaseHandler.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import RxSwift

struct MapBikeStationUseCaseHandler: MapBikeStationUseCase {
    
    let repository : MapBikeStationRepositoryInterface
    
    init(repository: MapBikeStationRepositoryInterface) {
        self.repository = repository
    }
    
    func fetchStationList() -> Observable<[BikeStationEntity]> {
        return repository.fetchBikeStations(at: nil, page: 0, size: 3000)
    }
    
}
