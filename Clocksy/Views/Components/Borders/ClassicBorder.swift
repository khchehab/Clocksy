//
//  ClassicBorder.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

struct ClassicBorder: BorderBaseView {
    var borderWidthRatio: CGFloat
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .strokeBorder(lineWidth: geometry.radius * borderWidthRatio)
    }
}
