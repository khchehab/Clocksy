//
//  GeometryProxy+Circle.swift
//  Clocksy
//
//  Created by Khaled Chehab on 30/08/2021.
//

import SwiftUI

extension GeometryProxy {
    var radius: CGFloat { min(size.width, size.height) / 2        }
    var center: CGPoint { CGPoint(x: radius, y: radius)           }
    var circle: CGRect  { .circle(radius: radius, center: center) }
}
