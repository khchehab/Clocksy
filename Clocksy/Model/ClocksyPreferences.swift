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
    
    init(key: ClocksyPreferenceKey, defaults: [ClocksyPreferenceKey: Any], storage: UserDefaults) {
        self.key = key
        self.defaults = defaults
        self.storage = storage
    }
}

final class ClocksyPreferences: ObservableObject {
    // MARK: - Analog Clock Preferences
    
    // MARK: - Border Preferences
    @ClocksyStylePreference(key: .borderWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var borderWidthRatio: Double
    
    // MARK: - Indicator Preferences
    @ClocksyStylePreference(key: .indicatorHourWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorHourBorderMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourBorderMarginRatio: Double
    
    @ClocksyStylePreference(key: .indicatorMinuteWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorMinuteWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorMinuteBorderMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorMinuteBorderMarginRatio: Double
    
    @ClocksyStylePreference(key: .indicatorHourTextWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextWidthRatio: Double
    @ClocksyStylePreference(key: .indicatorHourTextBorderMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextBorderMarginRatio: Double
    @ClocksyStylePreference(key: .indicatorHourTextFontName, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextFontName: String
    @ClocksyStylePreference(key: .indicatorHourTextFontWeight, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextFontWeight: String
    @ClocksyStylePreference(key: .indicatorHourTextFontSizeRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextFontSizeRatio: Double
    
    // MARK: - Arm Preferences
    @ClocksyStylePreference(key: .armHourRadiusRatio, defaults: Defaults.style, storage: userDefaults)
    var armHourRadiusRatio: Double
    @ClocksyStylePreference(key: .armHourMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var armHourMarginRatio: Double
    
    @ClocksyStylePreference(key: .armMinuteRadiusRatio, defaults: Defaults.style, storage: userDefaults)
    var armMinuteRadiusRatio: Double
    @ClocksyStylePreference(key: .armMinuteMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var armMinuteMarginRatio: Double
    
    @ClocksyStylePreference(key: .armSecondRadiusRatio, defaults: Defaults.style, storage: userDefaults)
    var armSecondRadiusRatio: Double
    @ClocksyStylePreference(key: .armSecondMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var armSecondMarginRatio: Double
    
    // MARK: - Digital Clock Preferences
    
    @ClocksyStylePreference(key: .paddingRatio, defaults: Defaults.style, storage: userDefaults)
    var paddingRatio: Double
    
    private static var userDefaults: UserDefaults = .standard
}
