//
//  ClassicBorder.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

struct ClassicBorder: BorderBaseView {
    var widthRatio: CGFloat // if this was used for other styles see if it can be moved to the protoco
                            // and used from there to avoid duplciating the same instance fields
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .strokeBorder(lineWidth: geometry.radius * widthRatio)
    }
}
