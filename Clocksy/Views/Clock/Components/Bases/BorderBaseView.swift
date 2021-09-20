//
//  BorderBaseView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

protocol BorderBaseView {
    associatedtype Content: View
    func content(geometry: GeometryProxy) -> Content
}
