//
//  ClocksyPreferences.swift
//  Clocksy
//
//  Created by Khaled Chehab on 18/09/2021.
//

import Foundation

// MARK: - Preference Key Wrapper
@propertyWrapper struct ClocksyPreference<ValueType> {
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
    @ClocksyPreference(key: .borderWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var borderWidthRatio: Double
    
    // MARK: - Indicator Preferences
    @ClocksyPreference(key: .indicatorHourWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourWidthRatio: Double
    @ClocksyPreference(key: .indicatorHourBorderMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourBorderMarginRatio: Double
    
    @ClocksyPreference(key: .indicatorMinuteWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorMinuteWidthRatio: Double
    @ClocksyPreference(key: .indicatorMinuteBorderMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorMinuteBorderMarginRatio: Double
    
    @ClocksyPreference(key: .indicatorHourTextWidthRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextWidthRatio: Double
    @ClocksyPreference(key: .indicatorHourTextBorderMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextBorderMarginRatio: Double
    @ClocksyPreference(key: .indicatorHourTextFontName, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextFontName: String
    @ClocksyPreference(key: .indicatorHourTextFontWeight, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextFontWeight: String
    @ClocksyPreference(key: .indicatorHourTextFontSizeRatio, defaults: Defaults.style, storage: userDefaults)
    var indicatorHourTextFontSizeRatio: Double
    
    // MARK: - Arm Preferences
    @ClocksyPreference(key: .armHourRadiusRatio, defaults: Defaults.style, storage: userDefaults)
    var armHourRadiusRatio: Double
    @ClocksyPreference(key: .armHourMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var armHourMarginRatio: Double
    
    @ClocksyPreference(key: .armMinuteRadiusRatio, defaults: Defaults.style, storage: userDefaults)
    var armMinuteRadiusRatio: Double
    @ClocksyPreference(key: .armMinuteMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var armMinuteMarginRatio: Double
    
    @ClocksyPreference(key: .armSecondRadiusRatio, defaults: Defaults.style, storage: userDefaults)
    var armSecondRadiusRatio: Double
    @ClocksyPreference(key: .armSecondMarginRatio, defaults: Defaults.style, storage: userDefaults)
    var armSecondMarginRatio: Double
    
    // MARK: - Digital Clock Preferences
    
    @ClocksyPreference(key: .paddingRatio, defaults: Defaults.style, storage: userDefaults)
    var paddingRatio: Double
    
    private static var userDefaults: UserDefaults = .standard
}
