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
    
    func content(component: TimeComponent, value: Int, geometry: GeometryProxy) -> some View {
        let timeComponentMultiplier = component == .hours ? Constants.degreesPerHour : Constants.degreesPerMinute
        let angle = Angle(degrees: timeComponentMultiplier * Double(value))
        
        return Circle()
                .frame(width: widthRatio * geometry.radius, height: borderMarginRatio * geometry.radius)
                .position(CGPoint(at: angle, in: geometry.circle, margin: borderMarginRatio * geometry.radius))
    }
}

struct ClassicHourTextIndicator: IndicatorTextBaseView {
    static var indicatorTextWidthRatio:        CGFloat     { 1 / 15 }
    static var indicatorTextBorderMarginRatio: CGFloat     { 1 / 4  }
    static var indicatorTextFontName:          String      { "HelveticaNeue" }
    static var indicatorTextFontSizeRatio:     CGFloat     { 1 / 8 }
    static var indicatorTextFontWeight:        Font.Weight { .bold }
    
    func content(geometry: GeometryProxy, display text: String) -> some View {
        Text(text)
            .fontWeight(Self.indicatorTextFontWeight)
            .font(.custom(Self.indicatorTextFontName, size: geometry.radius * Self.indicatorTextFontSizeRatio))
    }
}
