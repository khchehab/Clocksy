//
//  CGRect+Circle.swift
//  Clocksy
//
//  Created by Khaled Chehab on 29/08/2021.
//

import SwiftUI

extension CGRect {
    var center: CGPoint { CGPoint(x: midX, y: midY) }
    
    static func circle(radius: CGFloat, center: CGPoint) -> CGRect {
        let width = radius * 2
        return .init(x: center.x - radius, y: center.y - radius, width: width, height: width)
    }
}
