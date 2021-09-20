//
//  ClassicArm.swift
//  Clocksy
//
//  Created by Khaled Chehab on 03/09/2021.
//

import SwiftUI

struct ClassicArm: ArmBaseView {
    var radiusRatio: CGFloat
    var marginRatio: CGFloat
    
    func content(at angle: Angle, geometry: GeometryProxy) -> some View {
        let radius: CGFloat = radiusRatio * geometry.radius * 2
        let margin: CGFloat = marginRatio * geometry.radius * 2
        
        return ClassicArmShape(geometry.center, radius, margin)
                .rotation(angle)
    }
}

struct ClassicArmShape: Shape {
    let center: CGPoint
    let radius: CGFloat
    let margin: CGFloat
    
    init(_ center: CGPoint, _ radius: CGFloat, _ margin: CGFloat) {
        self.center = center
        self.radius = radius
        self.margin = margin
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: .zero, endAngle: .pi, clockwise: false)
        path.addLine(to: CGPoint(x: center.x, y: center.y - margin))
        path.addLine(to: CGPoint(x: center.x + radius, y: center.y))
        
        return path
    }
}
