//
//  WebRepository.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import Moya

protocol WebRepository {
    
    associatedtype ProviderType: MoyaProviderType
    
    init(provider: ProviderType)
    
}
