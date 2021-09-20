//
//  ArmBaseView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import SwiftUI

protocol ArmBaseView {
    associatedtype Content: View
    func content(at angle: Angle, geometry: GeometryProxy) -> Content
}
