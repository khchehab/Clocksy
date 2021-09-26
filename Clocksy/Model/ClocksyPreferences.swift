//
//  ClocksyPreferences.swift
//  Clocksy
//
//  Created by Khaled Chehab on 18/09/2021.
//

import Foundation
import SwiftUI
import Combine

private protocol PublishedWrapper: AnyObject {
    var objectWillChange: ObservableObjectPublisher? { get set }
}

// TODO check if below repeated code can be reduced

@propertyWrapper class ClocksyPreference<ValueType>: PublishedWrapper {
    private let key: ClocksyPreferenceKey
    private let defaultValue: ValueType
    private var storage: UserDefaults
    
    fileprivate var objectWillChange: ObservableObjectPublisher?
    var wrappedValue: ValueType {
        get {
            // if the preference is a font weight
            if let _ = defaultValue as? Font.Weight {
                if let rawValue = storage.object(forKey: key.key) as? Font.Weight.RawValue,
                   let fontWeight = Font.Weight(rawValue: rawValue) {
                    return fontWeight as! ValueType
                } else {
                    return defaultValue
                }
            // if the preference is a clock style
            } else if let _ = defaultValue as? ClockStyle {
                if let rawValue = storage.object(forKey: key.key) as? ClockStyle.RawValue,
                   let clockStyle = ClockStyle(rawValue: rawValue) {
                    return clockStyle as! ValueType
                } else {
                    return defaultValue
                }
            // if the preference is any other type (ie. String, Bool, Double, etc...)
            } else {
                return storage.object(forKey: key.key) as? ValueType ?? defaultValue
            }
        }
        set {
            if let fontWeight = newValue as? Font.Weight {
                storage.set(fontWeight.rawValue, forKey: key.key)
            } else if let clockStyle = newValue as? ClockStyle {
                storage.set(clockStyle.rawValue, forKey: key.key)
            } else {
                storage.set(newValue, forKey: key.key)
            }
            
            objectWillChange?.send()
        }
    }
    
    init(key: ClocksyPreferenceKey, default defaultValue: ValueType, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
    
    convenience init(key: ClocksyGlobalPreferenceKey, default defaultValue: ValueType, storage: UserDefaults = .standard) {
        self.init(key: key as ClocksyPreferenceKey, default: defaultValue, storage: storage)
    }
    
    convenience init(key: ClocksyStylePreferenceKey, defaults: [ClocksyPreferenceKey: Any], storage: UserDefaults = .standard) {
        let defaultValue: ValueType = defaults[key] as! ValueType
        self.init(key: key as ClocksyPreferenceKey, default: defaultValue, storage: storage)
    }
}

final class ClocksyPreferences: ObservableObject {
    // MARK: - Global App Preferences
    
    @ClocksyPreference(key: .advancedMode, default: Defaults.advancedMode)
    var advancedMode: Bool
    
    @ClocksyPreference(key: .style, default: Defaults.style)
    var style: ClockStyle
    
    @ClocksyPreference(key: .showAnalogClock, default: Defaults.showAnalogClock)
    var showAnalogClock: Bool
    @ClocksyPreference(key: .showDigitalClock, default: Defaults.showDigitalClock)
    var showDigitalClock: Bool
    
    // MARK: - Analog Clock Preferences
    
    // MARK: - Border Preferences
    @ClocksyPreference(key: .borderWidthRatio, defaults: Defaults.stylePreferences)
    var borderWidthRatio: Double
    
    // MARK: - Indicator Preferences
    @ClocksyPreference(key: .indicatorHourWidthRatio, defaults: Defaults.stylePreferences)
    var indicatorHourWidthRatio: Double
    @ClocksyPreference(key: .indicatorHourBorderMarginRatio, defaults: Defaults.stylePreferences)
    var indicatorHourBorderMarginRatio: Double
    
    @ClocksyPreference(key: .indicatorMinuteWidthRatio, defaults: Defaults.stylePreferences)
    var indicatorMinuteWidthRatio: Double
    @ClocksyPreference(key: .indicatorMinuteBorderMarginRatio, defaults: Defaults.stylePreferences)
    var indicatorMinuteBorderMarginRatio: Double
    
    @ClocksyPreference(key: .indicatorHourTextWidthRatio, defaults: Defaults.stylePreferences)
    var indicatorHourTextWidthRatio: Double
    @ClocksyPreference(key: .indicatorHourTextBorderMarginRatio, defaults: Defaults.stylePreferences)
    var indicatorHourTextBorderMarginRatio: Double
    @ClocksyPreference(key: .indicatorHourTextFontName, defaults: Defaults.stylePreferences)
    var indicatorHourTextFontName: String
    @ClocksyPreference(key: .indicatorHourTextFontWeight, defaults: Defaults.stylePreferences)
    var indicatorHourTextFontWeight: Font.Weight
    @ClocksyPreference(key: .indicatorHourTextFontSizeRatio, defaults: Defaults.stylePreferences)
    var indicatorHourTextFontSizeRatio: Double
    
    // MARK: - Arm Preferences
    @ClocksyPreference(key: .armHourRadiusRatio, defaults: Defaults.stylePreferences)
    var armHourRadiusRatio: Double
    @ClocksyPreference(key: .armHourMarginRatio, defaults: Defaults.stylePreferences)
    var armHourMarginRatio: Double
    
    @ClocksyPreference(key: .armMinuteRadiusRatio, defaults: Defaults.stylePreferences)
    var armMinuteRadiusRatio: Double
    @ClocksyPreference(key: .armMinuteMarginRatio, defaults: Defaults.stylePreferences)
    var armMinuteMarginRatio: Double
    
    @ClocksyPreference(key: .armSecondRadiusRatio, defaults: Defaults.stylePreferences)
    var armSecondRadiusRatio: Double
    @ClocksyPreference(key: .armSecondMarginRatio, defaults: Defaults.stylePreferences)
    var armSecondMarginRatio: Double
    
    // MARK: - Digital Clock Preferences
    
    @ClocksyPreference(key: .paddingRatio, defaults: Defaults.stylePreferences)
    var paddingRatio: Double
    
    init() {
        let mirror = Mirror(reflecting: self)
        mirror.children.forEach { child in
            if let preference = child.value as? PublishedWrapper {
                preference.objectWillChange = self.objectWillChange
            }
        }
    }
}
