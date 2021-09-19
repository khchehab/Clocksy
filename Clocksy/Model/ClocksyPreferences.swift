//
//  ClocksyStylePreferences.swift
//  Clocksy
//
//  Created by Khaled Chehab on 18/09/2021.
//

import Foundation

// MARK: - Style Preference Key Wrapper
@propertyWrapper struct ClocksyStylePreference<ValueType> {
    private let key: ClocksyPreferenceKey
    private let defaults: [ClocksyPreferenceKey: Any]
    private var storage: UserDefaults
    
    var wrappedValue: ValueType {
        get {
            storage.object(forKey: key.rawValue) as? ValueType ?? (defaults[key] as! ValueType)
        }
        set {
            storage.set(newValue, forKey: key.rawValue)
        }
    }
    
    init(key: ClocksyPreferenceKey, defaults: [ClocksyPreferenceKey: Any], storage: UserDefaults = .standard) {
        self.key = key
        self.defaults = defaults
        self.storage = storage
    }
}

final class ClocksyPreferences: ObservableObject {
    // MARK: - Analog Clock Preferences
    
    // MARK: - Border Preferences
    @ClocksyStylePreference(key: .borderWidthRatio, defaults: Defaults.style)
    var borderWidthRatio: Double
    
    // MARK: - Indicator Preferences
    @ClocksyStylePreference(key: .indicatorHourWidthRatio, defaults: Defaults.style)
    var indicatorHourWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorHourBorderMarginRatio, defaults: Defaults.style)
    var indicatorHourBorderMarginRatio: Double
    
    @ClocksyStylePreference(key: .indicatorMinuteWidthRatio, defaults: Defaults.style)
    var indicatorMinuteWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorMinuteBorderMarginRatio, defaults: Defaults.style)
    var indicatorMinuteBorderMarginRatio: Double
    
    @ClocksyStylePreference(key: .indicatorHourTextWidthRatio, defaults: Defaults.style)
    var indicatorHourTextWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorHourTextBorderMarginRatio, defaults: Defaults.style)
    var indicatorHourTextBorderMarginRatio: Double
    @ClocksyStylePreference(key: .indicatorHourTextFontName, defaults: Defaults.style)
    var indicatorHourTextFontName: String
    @ClocksyStylePreference(key: .indicatorHourTextFontWeight, defaults: Defaults.style)
    var indicatorHourTextFontWeight: String
    @ClocksyStylePreference(key: .indicatorHourTextFontSizeRatio, defaults: Defaults.style)
    var indicatorHourTextFontSizeRatio: Double
    
    // MARK: - Arm Preferences
    @ClocksyStylePreference(key: .armHourRadiusRatio, defaults: Defaults.style)
    var armHourRadiusRatio: Double
    @ClocksyStylePreference(key: .armHourMarginRatio, defaults: Defaults.style)
    var armHourMarginRatio: Double
    
    @ClocksyStylePreference(key: .armMinuteRadiusRatio, defaults: Defaults.style)
    var armMinuteRadiusRatio: Double
    @ClocksyStylePreference(key: .armMinuteMarginRatio, defaults: Defaults.style)
    var armMinuteMarginRatio: Double
    
    @ClocksyStylePreference(key: .armSecondRadiusRatio, defaults: Defaults.style)
    var armSecondRadiusRatio: Double
    @ClocksyStylePreference(key: .armSecondMarginRatio, defaults: Defaults.style)
    var armSecondMarginRatio: Double
    
    // MARK: - Digital Clock Preferences
    
    @ClocksyStylePreference(key: .paddingRatio, defaults: Defaults.style)
    var paddingRatio: Double
}
