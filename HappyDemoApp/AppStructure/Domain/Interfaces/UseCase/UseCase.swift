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
    
    associatedtype UseCaseValueType
    
}

protocol UseCaseResponse {
    associatedtype ResultType
    
    typealias Response = Result<ResultType,Error>
}


protocol UseCase {
    
    func execute<Value: UseCaseRequestValue,Response:UseCaseResponse>(request: Value) -> Observable<Response.Response>
}
