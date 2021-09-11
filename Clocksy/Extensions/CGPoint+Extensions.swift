//
//  CGPoint+Extensions.swift
//  Clocksy
//
//  Created by Khaled Chehab on 29/08/2021.
//

import SwiftUI

// MARK: - Get a point based on an angle
extension CGPoint {
    init(at angle: Angle, in circle: CGRect, margin: CGFloat = 0) {
        let multiplier: CGFloat = (circle.width / 2) - margin
        let radians: Double = angle.radians - (.pi / 2)
        
        self.init(x: circle.midX + multiplier * CGFloat(cos(radians)),
                  y: circle.midY + multiplier * CGFloat(sin(radians)))
    }
}

// MARK: - Get a point by multiplying a ratio point with a frame
extension CGPoint {
    static func * (lhs: CGPoint, rhs: CGRect) -> CGPoint {
        return CGPoint(x: lhs.x * rhs.width, y: lhs.y * rhs.height)
    }
}
