//
//  ClassicArm.swift
//  Clocksy
//
//  Created by Khaled Chehab on 03/09/2021.
//

import SwiftUI

struct ClassicArm: Shape {
    let center: CGPoint
    let radius: CGFloat
    let margin: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: .zero, endAngle: .pi, clockwise: false)
        path.addLine(to: CGPoint(x: center.x, y: center.y - margin))
        path.addLine(to: CGPoint(x: center.x + radius, y: center.y))
        
        return path
    }
}
