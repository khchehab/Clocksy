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

struct ClassicHourTextIndicator: IndicatorBaseView {
    var widthRatio: CGFloat
    var borderMarginRatio: CGFloat
    var fontName: String
    var fontSizeRatio: CGFloat
    var fontWeightValue: String
    
    var fontWeight: Font.Weight {
        switch(fontWeightValue) {
        case "bold":
            return Font.Weight.bold
        default:
            return Font.Weight.regular
        }
    }
    
    func content(component: TimeComponent, value: Int, geometry: GeometryProxy) -> some View {
        let timeComponentMultiplier = component == .hours ? Constants.degreesPerHour : Constants.degreesPerMinute
        let angle = Angle(degrees: timeComponentMultiplier * Double(value))
        
        return Text(String(value))
                .fontWeight(fontWeight)
                .font(.custom(fontName, size: geometry.radius * fontSizeRatio))
                .position(CGPoint(at: angle, in: geometry.circle, margin: borderMarginRatio * geometry.radius))
    }
}
