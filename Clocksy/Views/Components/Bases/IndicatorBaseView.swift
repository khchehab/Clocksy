//
//  IndicatorBaseView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 02/09/2021.
//

import SwiftUI

protocol IndicatorBaseView {
    associatedtype Content: View
    func content(component: TimeComponent, value: Int, geometry: GeometryProxy) -> Content
}

protocol IndicatorTextBaseView {
    associatedtype Content: View
    
    static var indicatorTextWidthRatio:        CGFloat     { get }
    static var indicatorTextBorderMarginRatio: CGFloat     { get }
    static var indicatorTextFontName:          String      { get }
    static var indicatorTextFontSizeRatio:     CGFloat     { get }
    static var indicatorTextFontWeight:        Font.Weight { get }
    
    func content(geometry: GeometryProxy, display text: String) -> Content
}
