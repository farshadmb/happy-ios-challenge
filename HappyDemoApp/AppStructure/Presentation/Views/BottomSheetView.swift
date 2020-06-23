//
//  BottomSheetView.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/23/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import Foundation
import SwiftUI

struct BottomSheetView<ContentView: View> : View {
    
    @Binding var isOpen: Bool
    
    @State var transitionOffset: CGFloat = 0
    
    let contentView: ContentView
    let maxHeight: CGFloat
    let minHeight: CGFloat
    
    var offset: CGFloat {
        return isOpen ? 0 : maxHeight - minHeight
    }
    
    init(isOpen open: Binding<Bool>,maxHeight: CGFloat,minHeight: CGFloat? = nil, @ViewBuilder content: () -> ContentView) {
        self._isOpen = open
        self.maxHeight = maxHeight
        self.minHeight = minHeight ?? maxHeight * 0.15
        contentView = content()
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Capsule()
                    .fill(Color.secondary)
                    .frame(width: 30, height: 3.0)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0.0))
                self.contentView
            }
            .frame(width: proxy.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(15)
            .frame(height: proxy.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.transitionOffset, 0))
        }
        .gesture (
            DragGesture()
                .onChanged { drag in
                    self.transitionOffset = min(drag.translation.height, self.minHeight)
            }
            .onEnded { value in
                let factor = self.maxHeight * 0.75
                
                guard abs(value.translation.height) > factor else {
                    return
                }
                
                self.isOpen = value.translation.height < 0
            }
        )
    }
    
}
