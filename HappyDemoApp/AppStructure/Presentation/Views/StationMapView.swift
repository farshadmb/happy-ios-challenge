//
//  StationMapView.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import SwiftUI

struct StationMapView: View {
    
    @ObservedObject var viewModel: StationListMapViewModel
    
    private let mapView = GoogleMapAdapterView()
    
    var body: some View {
        mapView
            .update(items: viewModel.items.compactMap( { $0.cluster }))
            .onAppear(perform: {
                self.viewModel.send(event: .load)
            })
//            .overlay(
//                Button(action: {
//                    //TODO: call Mapper to center now.
//                }) {
//                    Image(systemName: "location.fill")
//                        .foregroundColor(Color.gray)
//                        .padding()
//                        .background(Color.white)
//                        .clipShape(Circle())
//                }
//                .padding()
//
//                , alignment: .bottomTrailing)
        
    }
}

struct StationMapView_Previews: PreviewProvider {
    static var previews: some View {
        StationMapView(viewModel: StationListMapViewModel(state: .idle,
                                                          useCase: MapBikeStationUseCaseHandler(repository: DefaultBikeStationRespository.default)))
    }
}
