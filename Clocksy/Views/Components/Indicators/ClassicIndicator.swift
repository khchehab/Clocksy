//
//  ClassicIndicator.swift
//  Clocksy
//
//  Created by Khaled Chehab on 02/09/2021.
//

import SwiftUI

struct ClassicHourIndicator: IndicatorBaseView {
    static var indicatorWidthRatio:        CGFloat { 1 / 20 }
    static var indicatorBorderMarginRatio: CGFloat { 1 / 15 }
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .frame(width: Self.indicatorWidthRatio * geometry.radius,
                   height: Self.indicatorWidthRatio * geometry.radius)
    }
}

struct ClassicHourTextIndicator: IndicatorTextBaseView {
    static var indicatorTextWidthRatio:        CGFloat { 1 / 20 }
    static var indicatorTextBorderMarginRatio: CGFloat { 1 / 6  }
    
    func content(geometry: GeometryProxy, display text: String) -> some View {
        Text(text)
    }
}

struct ClassicMinuteIndicator: IndicatorBaseView {
    static var indicatorWidthRatio:        CGFloat { 1 / 60 }
    static var indicatorBorderMarginRatio: CGFloat { 1 / 15 }
    
    func content(geometry: GeometryProxy) -> some View {
        Circle()
            .frame(width: Self.indicatorWidthRatio * geometry.radius,
                   height: Self.indicatorWidthRatio * geometry.radius)
    }
}
