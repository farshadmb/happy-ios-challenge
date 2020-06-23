//
//  MapBikeStationUseCase.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation

protocol MapBikeStationUseCase {

    typealias T = BikeStationEntity
    
    func fetchStationList() -> Observable<[T]>
    
}








