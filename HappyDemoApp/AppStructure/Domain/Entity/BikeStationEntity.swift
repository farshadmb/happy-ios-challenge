//
//  BikeStationEntity.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation


struct BikeStationEntity: Codable, Hashable {
    
    let stationID: String
    let name: String
    let rentalMethod: String
    let capacity: String
    let lat: String
    let lon: String
    let geocodedColumn: GeocodedColumnEntity

    enum CodingKeys: String, CodingKey {
        case stationID = "station_id"
        case name = "name"
        case rentalMethod = "rental_method"
        case capacity = "capacity"
        case lat = "lat"
        case lon = "lon"
        case geocodedColumn = "geocoded_column"
    }
}

// MARK: - GeocodedColumn
struct GeocodedColumnEntity: Codable, Hashable {
    let latitude: String
    let longitude: String

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }
}
