//
//  SettingsView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var preferences: ClocksyPreferences
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Label("Style", systemImage: "paintpalette")
                    Picker($preferences.style.wrappedValue.rawValue, selection: $preferences.style) {
                        ForEach(ClockStyle.allCases, id: \.self) {
                            Text($0.rawValue.localizedCapitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                }

                ShowToggle(isOn: $preferences.showAnalogClock, label: "Show Analog", systemImage: "clock")

                if preferences.showAnalogClock {
                    DisclosureGroup("Border") {
                        RatioSlider(ratio: $preferences.borderWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", range: 0...1, step: 0.02, format: "%0.2f")
                    }

                    DisclosureGroup("Indicators") {
                        DisclosureGroup("Hour") {
                            RatioSlider(ratio: $preferences.indicatorHourWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", range: 0...1, step: 0.06, format: "%0.2f")
                            RatioSlider(ratio: $preferences.indicatorHourBorderMarginRatio, label: "Border Margin Ratio", systemImage: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right", range: 0...1, step: 0.1, format: "%0.2f")
                        }

                        DisclosureGroup("Minute") {
                            RatioSlider(ratio: $preferences.indicatorMinuteWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", range: 0...1, step: 0.02, format: "%0.2f")
                            RatioSlider(ratio: $preferences.indicatorMinuteBorderMarginRatio, label: "Border Margin Ratio", systemImage: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right", range: 0...1, step: 0.1, format: "%0.2f")
                        }

                        DisclosureGroup("Hour Text") {
                            RatioSlider(ratio: $preferences.indicatorHourTextWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", range: 0...1, step: 0.06, format: "%0.2f")
                            RatioSlider(ratio: $preferences.indicatorHourTextBorderMarginRatio, label: "Border Margin Ratio", systemImage: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right", range: 0...1, step: 0.25, format: "%0.2f")
                            //
                            //
                            RatioSlider(ratio: $preferences.indicatorHourTextFontSizeRatio, label: "Font Size Ratio", systemImage: "text.cursor", range: 0...1, step: 0.125, format: "%0.3f")
                        }
                    }
                }

                ShowToggle(isOn: $preferences.showDigitalClock, label: "Show Digital", systemImage: "24.circle")

                if preferences.showDigitalClock {
                    RatioSlider(ratio: $preferences.paddingRatio, label: "Padding Ratio", systemImage: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left", range: 0...1, step: 0.005, format: "%0.3f")
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ClocksyPreferences())
    }
}
