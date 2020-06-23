//
//  BikeStationTarget.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import Moya

enum BikeStationTarget {
    
    case fetchStationList(page: Int, size: Int)
}

extension BikeStationTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://data.melbourne.vic.gov.au/")!
    }
    
    var path: String {
        return "resource/vrwc-rwgm.json"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    
    var task: Task {
        switch self {
        case .fetchStationList(page: let page, size: let size):
            return .requestParameters(parameters: ["$offset":page, "$limit": size], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
        
    }
    
    var sampleData: Data {
           switch self {
           case .fetchStationList(page: let page, size: let size):
               return "Bike Station Request for page \(page) with size \(size)".data(using: .utf8, allowLossyConversion: false)!
           @unknown default:
               return "Bike Station Request default".data(using: .utf8, allowLossyConversion: false)!
           }
       }
       
       var headers: [String : String]? {
           return nil
       }
    
}
