//
//  StationMapViewModel.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/24/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import RxSwift
import Combine

class StationListMapViewModel: ObservableObject {
    
    @Published var items: [BikeStationViewModel] = []
    @Published var state: State = .idle
    
    enum State {
        case idle
        case loading
        case loaded
        case error(String)
    }
    
    enum Event {
        case load
        case select(item: BikeStationViewModel)
        case retry
    }
    
    let disposeBag = DisposeBag()
    
    let useCase : MapBikeStationUseCase
    
    init(state: State = .idle, useCase: MapBikeStationUseCase) {
        self.state = state
        self.useCase = useCase
    }
    
    func send(event: Event) {
        
        switch event {
        case .load, .retry:
            state = .loading
            useCase.fetchStationList()
                .map {
                    $0.compactMap { BikeStationViewModel(station : $0) }
            }
            .observeOn(MainScheduler.asyncInstance)
            .subscribe {[weak self] recieveEvent in
                switch recieveEvent {
                case .completed:
                    self?.state = .loaded
                case .next(let values):
                    self?.items = values
                case .error(let err):
                    self?.state = .error(err.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
            
        case .select(item: let itemSelected):
            print(itemSelected)
        }
        
    }
    
    
}
