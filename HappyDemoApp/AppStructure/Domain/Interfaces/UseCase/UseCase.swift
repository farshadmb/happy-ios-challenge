//
//  UseCase.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import RxSwift

protocol UseCaseRequestValue {
    
}

protocol UseCaseResponse {
    
}

typealias UseCaseResult<T: UseCaseRequestValue> = Result<T,Error>

protocol UseCase {
    
    typealias RequestType = UseCaseRequestValue
    typealias ResponseType = UseCaseResponse
    
    func execute<T: ResponseType>(requestValue: RequestType) -> Observable<UseCaseResult<T>>
}
