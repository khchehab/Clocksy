//
//  Defaults.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import Foundation
import SwiftUI

struct Defaults {
    static let advancedMode: Bool = false
    static let style: ClockStyle = .classic
    static let showAnalogClock: Bool = true
    static let showDigitalClock: Bool = true
    
    // classic style defaults
    static let stylePreferences: [ClocksyPreferenceKey: Any] = [
        // MARK: - Analog Clock Defaults
        
        // MARK: - Border Defaults
        ClocksyStylePreferenceKey.borderWidthRatio: 1.0 / 50.0,
        
        // MARK: - Indicator Defaults
        // hour indicator
        ClocksyStylePreferenceKey.indicatorHourWidthRatio: 1.0 / 15.0, ClocksyStylePreferenceKey.indicatorHourBorderMarginRatio: 1.0 / 10.0,
        // minute indicator
        ClocksyStylePreferenceKey.indicatorMinuteWidthRatio: 1.0 / 50.0, ClocksyStylePreferenceKey.indicatorMinuteBorderMarginRatio: 1.0 / 10.0,
        // hour text indicator
        ClocksyStylePreferenceKey.indicatorHourTextWidthRatio: 1.0 / 15.0, ClocksyStylePreferenceKey.indicatorHourTextBorderMarginRatio: 1.0 / 4.0,
            ClocksyStylePreferenceKey.indicatorHourTextFontName: "HelveticaNeue", ClocksyStylePreferenceKey.indicatorHourTextFontWeight: Font.Weight.bold,
            ClocksyStylePreferenceKey.indicatorHourTextFontSizeRatio: 1.0 / 8.0,
        
        // MARK: - Arm Defaults
        ClocksyStylePreferenceKey.armHourRadiusRatio: 1.0 / 100.0, ClocksyStylePreferenceKey.armHourMarginRatio: 1.0 / 5.0,
        ClocksyStylePreferenceKey.armMinuteRadiusRatio: 1.0 / 200.0, ClocksyStylePreferenceKey.armMinuteMarginRatio: 1.0 / 4.0,
        ClocksyStylePreferenceKey.armSecondRadiusRatio: 1.0 / 400.0, ClocksyStylePreferenceKey.armSecondMarginRatio: 1.0 / 3.0
    ]
    
    private init() {}
}
