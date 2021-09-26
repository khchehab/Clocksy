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
        case .ultraLight: return "ultraLight"
        case .thin: return "thin"
        case .light: return "light"
        case .regular: return "regular"
        case .medium: return "medium"
        case .semibold: return "semibold"
        case .bold: return "bold"
        case .heavy: return "heavy"
        case .black: return "black"
        default: return ""
        }
    }
    
    public init?(rawValue: String) {
        switch(rawValue) {
        case "ultraLight": self = .ultraLight
        case "thin": self = .thin
        case "light": self = .light
        case "regular": self = .regular
        case "medium": self = .medium
        case "semibold": self = .semibold
        case "bold": self = .bold
        case "heavy": self = .heavy
        case "black": self = .black
        default: return nil
        }
    }
}

extension Font.Weight: CaseIterable {
    public static var allCases: [Font.Weight] {
        [.ultraLight, .thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black]
    }
}
