//
//  ClocksyPreferences.swift
//  Clocksy
//
//  Created by Khaled Chehab on 18/09/2021.
//

import Foundation

// todo see if the below can be consolidated into a single property wrapper struct
// with extensions of whatever features available in swift

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

// MARK: - Global App Key Wrapper for Enums
@propertyWrapper struct ClocksyRawRepresentablePreference<ValueType: RawRepresentable> {
    private let key: ClocksyPreferenceKey
    private let defaultValue: ValueType
    private var storage: UserDefaults
    
    var wrappedValue: ValueType {
        get {
            if let rawValue = storage.object(forKey: key.rawValue) as? ValueType.RawValue,
               let enumValue = ValueType(rawValue: rawValue) {
                return enumValue
            } else {
                return defaultValue
            }
        }
        set {
            storage.set(newValue.rawValue, forKey: key.rawValue)
        }
    }
    
    init(key: ClocksyPreferenceKey, default defaultValue: ValueType, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}

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

final class ClocksyPreferences: ObservableObject {
    // MARK: - Global App Preferences
    
    @ClocksyRawRepresentablePreference(key: .style, default: Defaults.style)
    var style: ClockStyle
    
    @ClocksyPreference(key: .showAnalogClock, default: Defaults.showAnalogClock)
    var showAnalogClock: Bool
    @ClocksyPreference(key: .showDigitalClock, default: Defaults.showDigitalClock)
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
