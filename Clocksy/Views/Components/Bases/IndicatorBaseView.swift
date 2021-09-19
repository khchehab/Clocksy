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
