//
//  BorderBaseView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

protocol BorderBaseView {
    associatedtype Content: View
    
    static var borderWidthRatio: CGFloat { get }
    
    func content(geometry: GeometryProxy) -> Content
}
