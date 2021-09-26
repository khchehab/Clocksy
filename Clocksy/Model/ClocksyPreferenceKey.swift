//
//  ClocksyPreferenceKey.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import Foundation

class ClocksyPreferenceKey: Hashable {
    private(set) var key: String
    fileprivate init(family: String, code: String) {
        self.key = family + "." + code
    }
    
    static func == (lhs: ClocksyPreferenceKey, rhs: ClocksyPreferenceKey) -> Bool {
        return lhs.key == rhs.key
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}

class ClocksyGlobalPreferenceKey: ClocksyPreferenceKey {
    static let style = ClocksyGlobalPreferenceKey(family: "global", code: "style")
    static let showAnalogClock = ClocksyGlobalPreferenceKey(family: "global", code: "show-analog-clock")
    static let showDigitalClock = ClocksyGlobalPreferenceKey(family: "global", code: "show-digital-clock")
}

class ClocksyStylePreferenceKey: ClocksyPreferenceKey {
    static let borderWidthRatio = ClocksyStylePreferenceKey(family: "style", code: "border.width-ratio")
    
    static let indicatorHourWidthRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.width-ratio")
    static let indicatorHourBorderMarginRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.border-margin-ratio")
    
    static let indicatorMinuteWidthRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.minute.width-ratio")
    static let indicatorMinuteBorderMarginRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.minute.border-margin-ratio")
    
    static let indicatorHourTextWidthRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.text.width-ratio")
    static let indicatorHourTextBorderMarginRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.text.border-margin-ratio")
    static let indicatorHourTextFontName = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.text.font-name")
    static let indicatorHourTextFontWeight = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.text.font-weight")
    static let indicatorHourTextFontSizeRatio = ClocksyStylePreferenceKey(family: "style", code: "indicator.hour.text.font-size-ratio")
    
    static let armHourRadiusRatio = ClocksyStylePreferenceKey(family: "style", code: "arm.hour.radius-ratio")
    static let armHourMarginRatio = ClocksyStylePreferenceKey(family: "style", code: "arm.hour.margin-ratio")
    
    static let armMinuteRadiusRatio = ClocksyStylePreferenceKey(family: "style", code: "arm.minute.radius-ratio")
    static let armMinuteMarginRatio = ClocksyStylePreferenceKey(family: "style", code: "arm.minute.margin-ratio")
    
    static let armSecondRadiusRatio = ClocksyStylePreferenceKey(family: "style", code: "arm.second.radius-ratio")
    static let armSecondMarginRatio = ClocksyStylePreferenceKey(family: "style", code: "arm.second.margin-ratio")

    static let paddingRatio = ClocksyStylePreferenceKey(family: "style", code: "padding")
}
