//
//  ClassicBorder.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

struct ClassicBorder: BorderBaseView {
    static var borderWidthRatio: CGFloat { 1 / 50 }
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .strokeBorder(lineWidth: geometry.radius * Self.borderWidthRatio)
    }
}
