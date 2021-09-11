//
//  IndicatorBaseView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 02/09/2021.
//

import SwiftUI

protocol IndicatorBaseView {
    associatedtype Content: View
    
    static var indicatorWidthRatio: CGFloat { get }
    static var indicatorBorderMarginRatio: CGFloat { get }
    
    func content(geometry: GeometryProxy) -> Content
}

protocol IndicatorTextBaseView {
    associatedtype Content: View
    
    static var indicatorTextWidthRatio: CGFloat { get }
    static var indicatorTextBorderMarginRatio: CGFloat { get }
    
    func content(geometry: GeometryProxy, display text: String) -> Content
}
