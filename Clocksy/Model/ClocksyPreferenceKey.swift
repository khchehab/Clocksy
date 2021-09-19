//
//  ClocksyPreferenceKey.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import Foundation

// todo see if this can be improved to be more OOP or follow more the Swift features
enum ClocksyPreferenceKey: String {
    // MARK: - Border Keys
    case borderWidthRatio = "border.width-ratio"
    
    // MARK: - Indicator Keys
    case indicatorHourWidthRatio = "indicator.hour.width-ratio", indicatorHourBorderMarginRatio = "indicator.hour.border-margin-ratio"
    case indicatorMinuteWidthRatio = "indicator.minute.width-ratio", indicatorMinuteBorderMarginRatio = "indicator.minute.border-margin-ratio"
    case indicatorHourTextWidthRatio = "indicator.hour.text.width-ratio", indicatorHourTextBorderMarginRatio = "indicator.hour.text.border-margin-ratio",
         indicatorHourTextFontName = "indicator.hour.text.font-name", indicatorHourTextFontWeight = "indicator.hour.text.font-weight",
         indicatorHourTextFontSizeRatio = "indicator.hour.text.font-size-ratio"
    
    // MARK: - Arm Keys
    case armHourRadiusRatio = "arm.hour.radius-ratio", armHourMarginRatio = "arm.hour.margin-ratio"
    case armMinuteRadiusRatio = "arm.minute.radius-ratio", armMinuteMarginRatio = "arm.minute.margin-ratio"
    case armSecondRadiusRatio = "arm.second.radius-ratio", armSecondMarginRatio = "arm.second.margin-ratio"
}