//
//  IndicatorBaseView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 02/09/2021.
//

import SwiftUI

protocol IndicatorBaseView {
    associatedtype Content: View
    func content(at angle: Angle, geometry: GeometryProxy) -> Content
}

protocol IndicatorTextBaseView {
    associatedtype Content: View
    func content(at angle: Angle, value: Int, geometry: GeometryProxy) -> Content
}
