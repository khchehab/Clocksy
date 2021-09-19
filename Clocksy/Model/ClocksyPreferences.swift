//
//  ClocksyStylePreferences.swift
//  Clocksy
//
//  Created by Khaled Chehab on 18/09/2021.
//

import Foundation

// MARK: - Style Preference Key Wrapper
@propertyWrapper struct ClocksyStylePreference<ValueType> {
    private let key: ClocksyStylePreferenceKey
    private let defaults: [ClocksyStylePreferenceKey: Any]
    private var storage: UserDefaults
    
    var wrappedValue: ValueType {
        get {
            storage.object(forKey: key.rawValue) as? ValueType ?? (defaults[key] as! ValueType)
        }
        set {
            storage.set(newValue, forKey: key.rawValue)
        }
    }
    
    init(key: ClocksyStylePreferenceKey, defaults: [ClocksyStylePreferenceKey: Any], storage: UserDefaults = .standard) {
        self.key = key
        self.defaults = defaults
        self.storage = storage
    }
}

// MARK: - Global App Key Wrapper
@propertyWrapper struct ClocksyPreference<ValueType> {
    private let key: ClocksyPreferenceKey
    private let defaultValue: ValueType
    private var storage: UserDefaults
    
    var wrappedValue: ValueType {
        get {
            storage.object(forKey: key.rawValue) as? ValueType ?? defaultValue
        }
        set {
            storage.set(newValue, forKey: key.rawValue)
        }
    }
    
    init(key: ClocksyPreferenceKey, default defaultValue: ValueType, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}

final class ClocksyPreferences: ObservableObject {
    // MARK: - Global App Preferences
    
    @ClocksyPreference(key: .style, default: Defaults.style)
    var style: String
    
    @ClocksyPreference(key: .style, default: Defaults.showAnalogClock)
    var showAnalogClock: Bool
    @ClocksyPreference(key: .style, default: Defaults.showDigitalClock)
    var showDigitalClock: Bool
    
    // MARK: - Analog Clock Preferences
    
    // MARK: - Border Preferences
    @ClocksyStylePreference(key: .borderWidthRatio, defaults: Defaults.stylePreferences)
    var borderWidthRatio: Double
    
    // MARK: - Indicator Preferences
    @ClocksyStylePreference(key: .indicatorHourWidthRatio, defaults: Defaults.stylePreferences)
    var indicatorHourWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorHourBorderMarginRatio, defaults: Defaults.stylePreferences)
    var indicatorHourBorderMarginRatio: Double
    
    @ClocksyStylePreference(key: .indicatorMinuteWidthRatio, defaults: Defaults.stylePreferences)
    var indicatorMinuteWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorMinuteBorderMarginRatio, defaults: Defaults.stylePreferences)
    var indicatorMinuteBorderMarginRatio: Double
    
    @ClocksyStylePreference(key: .indicatorHourTextWidthRatio, defaults: Defaults.stylePreferences)
    var indicatorHourTextWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorHourTextBorderMarginRatio, defaults: Defaults.stylePreferences)
    var indicatorHourTextBorderMarginRatio: Double
    @ClocksyStylePreference(key: .indicatorHourTextFontName, defaults: Defaults.stylePreferences)
    var indicatorHourTextFontName: String
    @ClocksyStylePreference(key: .indicatorHourTextFontWeight, defaults: Defaults.stylePreferences)
    var indicatorHourTextFontWeight: String
    @ClocksyStylePreference(key: .indicatorHourTextFontSizeRatio, defaults: Defaults.stylePreferences)
    var indicatorHourTextFontSizeRatio: Double
    
    // MARK: - Arm Preferences
    @ClocksyStylePreference(key: .armHourRadiusRatio, defaults: Defaults.stylePreferences)
    var armHourRadiusRatio: Double
    @ClocksyStylePreference(key: .armHourMarginRatio, defaults: Defaults.stylePreferences)
    var armHourMarginRatio: Double
    
    @ClocksyStylePreference(key: .armMinuteRadiusRatio, defaults: Defaults.stylePreferences)
    var armMinuteRadiusRatio: Double
    @ClocksyStylePreference(key: .armMinuteMarginRatio, defaults: Defaults.stylePreferences)
    var armMinuteMarginRatio: Double
    
    @ClocksyStylePreference(key: .armSecondRadiusRatio, defaults: Defaults.stylePreferences)
    var armSecondRadiusRatio: Double
    @ClocksyStylePreference(key: .armSecondMarginRatio, defaults: Defaults.stylePreferences)
    var armSecondMarginRatio: Double
    
    // MARK: - Digital Clock Preferences
    
    @ClocksyStylePreference(key: .paddingRatio, defaults: Defaults.stylePreferences)
    var paddingRatio: Double
}
