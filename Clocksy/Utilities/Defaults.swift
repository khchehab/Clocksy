//
//  Defaults.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import Foundation

struct Defaults {
    static let style: [ClocksyPreferenceKey: Any] = [
        // MARK: - Analog Clock Defaults
        
        // MARK: - Border Defaults
        .borderWidthRatio: 1.0 / 50.0,
        
        // MARK: - Indicator Defaults
        .indicatorHourWidthRatio: 1.0 / 15.0, .indicatorHourBorderMarginRatio: 1.0 / 10.0,
        .indicatorMinuteWidthRatio: 1.0 / 50.0, .indicatorMinuteBorderMarginRatio: 1.0 / 10.0,
        .indicatorHourTextWidthRatio: 1.0 / 15.0, .indicatorHourTextBorderMarginRatio: 1.0 / 4.0, .indicatorHourTextFontName: "HelveticaNeue",
            .indicatorHourTextFontWeight: "bold", .indicatorHourTextFontSizeRatio: 1.0 / 8.0,
        
        // MARK: - Arm Defaults
        .armHourRadiusRatio: 1.0 / 100.0, .armHourMarginRatio: 1.0 / 5.0,
        .armMinuteRadiusRatio: 1.0 / 200.0, .armMinuteMarginRatio: 1.0 / 4.0,
        .armSecondRadiusRatio: 1.0 / 400.0, .armSecondMarginRatio: 1.0 / 3.0,
        
        // MARK: - Digital Clock Defaults
        
        .paddingRatio: 1.0 / 200.0
    ]
    
    private init() {}
}
