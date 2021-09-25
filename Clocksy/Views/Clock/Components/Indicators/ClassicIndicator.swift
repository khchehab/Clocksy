//
//  ClassicIndicator.swift
//  Clocksy
//
//  Created by Khaled Chehab on 02/09/2021.
//

import SwiftUI

struct ClassicIndicator: IndicatorBaseView {
    var widthRatio: CGFloat
    var borderMarginRatio: CGFloat
    
    func content(at angle: Angle, geometry: GeometryProxy) -> some View {
        return Circle()
                .frame(width: widthRatio * geometry.radius, height: borderMarginRatio * geometry.radius)
                .position(CGPoint(at: angle, in: geometry.circle, margin: borderMarginRatio * geometry.radius))
    }
}

struct ClassicHourTextIndicator: IndicatorTextBaseView {
    var widthRatio: CGFloat
    var borderMarginRatio: CGFloat
    var fontName: String
    var fontSizeRatio: CGFloat
    var fontWeightValue: String
    
    var fontWeight: Font.Weight {
        Font.Weight(rawValue: fontWeightValue) ?? Font.Weight.regular
    }
    
    func content(at angle: Angle, value: Int, geometry: GeometryProxy) -> some View {
        return Text(String(value))
                .fontWeight(fontWeight)
                .font(.custom(fontName, size: geometry.radius * fontSizeRatio))
                .position(CGPoint(at: angle, in: geometry.circle, margin: borderMarginRatio * geometry.radius))
    }
}
