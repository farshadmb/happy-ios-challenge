//
//  AppRootView.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct AppRootView: View {
    
    @State var isBottomSheetPresent: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            StationMapView()
                .frame(maxHeight:proxy.size.height * 0.9, alignment: .topLeading)
            BottomSheetView(
                isOpen: self.$isBottomSheetPresent,
                maxHeight: proxy.size.height * 0.85
            ) {
                Color.blue
            }
        }
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView()
    }
}
