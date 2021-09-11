//
//  ClassicIndicator.swift
//  Clocksy
//
//  Created by Khaled Chehab on 02/09/2021.
//

import SwiftUI

struct ClassicHourIndicator: IndicatorBaseView {
    static var indicatorWidthRatio:        CGFloat { 1 / 15 }
    static var indicatorBorderMarginRatio: CGFloat { 1 / 10 }
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .frame(width: Self.indicatorWidthRatio * geometry.radius,
                   height: Self.indicatorWidthRatio * geometry.radius)
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

struct ClassicMinuteIndicator: IndicatorBaseView {
    static var indicatorWidthRatio:        CGFloat { 1 / 50 }
    static var indicatorBorderMarginRatio: CGFloat { 1 / 10 }
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .frame(width: Self.indicatorWidthRatio * geometry.radius,
                   height: Self.indicatorWidthRatio * geometry.radius)
    }
}
