//
//  MapBikeStationRepository.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation

protocol MapBikeStationRepositoryInterface {
    
    func fetchBikeStations(at location: CLLocationCoordinate2D?, page: Int, size: Int) -> Observable<[BikeStationEntity]>
    
    
}
