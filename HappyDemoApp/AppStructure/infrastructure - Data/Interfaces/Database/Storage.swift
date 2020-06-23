//
//  Storage.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation

protocol Storage {
    
    typealias T = Storable

    func fetch<T:Storage> (type: T.Type) -> [T]
    
    func save(object: T) -> Bool
    
    func update(object: T) -> Bool
    
    func delete(object: T) -> Bool
    
    func deleteAll(objects: [T]) -> Bool
    
}
