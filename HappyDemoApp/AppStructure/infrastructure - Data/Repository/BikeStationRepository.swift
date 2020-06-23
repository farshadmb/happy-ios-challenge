//
//  BikeStationRepository.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import CoreLocation

typealias DefaultBikeStationRespository = BikeStationRepository<BikeStationTarget>

struct BikeStationRepository<T: TargetType>: WebRepository {

    typealias ProviderType = MoyaProvider<T>
    
    let provider: ProviderType
    
    init(provider: ProviderType) {
        self.provider = provider
    }
    
}

extension DefaultBikeStationRespository: MapBikeStationRepositoryInterface {
    
    static let `default` : DefaultBikeStationRespository = {
        return DefaultBikeStationRespository(provider: MoyaProvider<BikeStationTarget>())
    }()
    
    func fetchBikeStations(at location: CLLocationCoordinate2D?, page: Int, size: Int) -> Observable<[BikeStationEntity]> {
        return provider.rx.request(.fetchStationList(page: page, size: size))
            .map([BikeStationEntity].self)
            .asObservable()
    }
    
    
}
