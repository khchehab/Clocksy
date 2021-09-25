//
//  Font.Weight+Name.swift
//  Clocksy
//
//  Created by Khaled Chehab on 25/09/2021.
//

import SwiftUI

// TODO see what can be dont in order not to have rawValue and init? as public

extension Font.Weight: RawRepresentable {
    public var rawValue: String {
        switch(self) {
        case Self.ultraLight: return "ultraLight"
        case Self.thin: return "thin"
        case Self.light: return "light"
        case Self.regular: return "regular"
        case Self.medium: return "medium"
        case Self.semibold: return "semibold"
        case Self.bold: return "bold"
        case Self.heavy: return "heavy"
        case Self.black: return "black"
        default: return ""
        }
    }
    
    public init?(rawValue: String) {
        switch(rawValue) {
        case "ultraLight": self = Self.ultraLight
        case "thin": self = Self.thin
        case "light": self = Self.light
        case "regular": self = Self.regular
        case "medium": self = Self.medium
        case "semibold": self = Self.semibold
        case "bold": self = Self.bold
        case "heavy": self = Self.heavy
        case "black": self = Self.black
        default: return nil
        }
    }
}

extension Font.Weight: CaseIterable {
    public static var allCases: [Font.Weight] {
        [.ultraLight, .thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black]
    }
}
