//
//  BikeStationRepositoryTestes.swift
//  HappyDemoAppTests
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import XCTest
@testable import HappyDemoApp
import RxSwift
import Moya

class BikeStationRepositoryTestes: XCTestCase {
    
    let disposeBag = DisposeBag()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchDefaultBikeStationRepository() {
        
        let e = expectation(description: "Default Bike Station Repository")
        e.expectedFulfillmentCount = 2
        let repository = DefaultBikeStationRespository.default
        
        repository.fetchBikeStations(at: nil, page: 0, size: 100)
            .subscribe { (event) in
                switch (event) {
                case .completed:
                    break
                case .error(let error):
                    print("error occured", error)
                    XCTAssertNil(error, "Error occured in \(e.description) \n Error Info: \(error)")
                case .next(let values):
                    print("response",values)
                    XCTAssertFalse(values.isEmpty, "Values is Empty!")
                }
                
                e.fulfill()
        }
        .disposed(by: disposeBag)
        
        
        self.waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error, "Error occured in \(e.description) \n Error Info: \(error!)")
        }
        
    }
    
    func testFetchEmptyValuesDefaultBikeStationRepository() {
        let e = expectation(description: "Default Bike Station Repository")
        e.expectedFulfillmentCount = 2
        let repository = DefaultBikeStationRespository.default
        
        repository.fetchBikeStations(at: nil, page: 0, size: 0)
            .subscribe { (event) in
                switch (event) {
                case .completed:
                    break
                case .error(let error):
                    print("error occured", error)
                    XCTAssertNil(error, "Error occured in \(e.description) \n Error Info: \(error)")
                case .next(let values):
                    print("response",values)
                    XCTAssertTrue(values.isEmpty, "Values is not empty!")
                }
                
                e.fulfill()
        }
        .disposed(by: disposeBag)
        
        
        self.waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error, "Error occured in \(e.description) \n Error Info: \(error!)")
        }
    }
    
    func testErrorHandlingDefaultBikeStationRepository() {
        let e = expectation(description: "Default Bike Station Repository")
        
        let repository = DefaultBikeStationRespository.default
        
        repository.fetchBikeStations(at: nil, page: 0, size: -1)
            .subscribe { (event) in
                
                XCTAssertNotNil(event.error, "Error not occured in \(e.description)")
                print("error occured with info ", event.error!.localizedDescription ?? "no info")
                guard event.error != nil else { return }
                e.fulfill()
        }
        .disposed(by: disposeBag)
        
        
        self.waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error, "Error occured in \(e.description) \n Error Info: \(error!)")
        }
    }
    
}
