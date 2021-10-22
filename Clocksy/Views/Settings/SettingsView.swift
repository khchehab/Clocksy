//
//  SettingsView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var preferences: ClocksyPreferences
    @State var isFontChooserPresented: Bool = false
    var width: CGFloat
    
    var maximumPadding: Double {
        (Double(width) * 0.1 / 5.0).rounded()
    }
    
    var body: some View {
        NavigationView {
            List {
                OptionPicker(option: $preferences.style, label: "Style", systemImage: "paintpalette")

                ShowToggle(isOn: $preferences.showAnalogClock, label: "Show Analog", systemImage: "clock")

                if preferences.advancedMode && preferences.showAnalogClock {
                    DisclosureGroup("Border") {
                        PreferenceSlider(value: $preferences.borderWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", minimumValue: 0, maximumValue: 1, step: 0.02, format: "%0.2f")
                    }

                    DisclosureGroup("Indicators") {
                        DisclosureGroup("Hour") {
                            PreferenceSlider(value: $preferences.indicatorHourWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", minimumValue: 0, maximumValue: 1, step: 0.06, format: "%0.2f")
                            PreferenceSlider(value: $preferences.indicatorHourBorderMarginRatio, label: "Border Margin Ratio", systemImage: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right", minimumValue: 0, maximumValue: 1, step: 0.1, format: "%0.2f")
                        }

                        DisclosureGroup("Minute") {
                            PreferenceSlider(value: $preferences.indicatorMinuteWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", minimumValue: 0, maximumValue: 1, step: 0.02, format: "%0.2f")
                            PreferenceSlider(value: $preferences.indicatorMinuteBorderMarginRatio, label: "Border Margin Ratio", systemImage: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right", minimumValue: 0, maximumValue: 1, step: 0.1, format: "%0.2f")
                        }

                        DisclosureGroup("Hour Text") {
                            PreferenceSlider(value: $preferences.indicatorHourTextWidthRatio, label: "Width Ratio", systemImage: "arrow.left.and.right.square", minimumValue: 0, maximumValue: 1, step: 0.06, format: "%0.2f")
                            PreferenceSlider(value: $preferences.indicatorHourTextBorderMarginRatio, label: "Border Margin Ratio", systemImage: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right", minimumValue: 0, maximumValue: 1, step: 0.25, format: "%0.2f")
                            
                            Button(action: {
                                self.isFontChooserPresented.toggle()
                            }, label: {
                                HStack {
                                    Label("Font Name", systemImage: "character")
                                    Text(preferences.indicatorHourTextFontName)
                                        .frame(maxWidth: .infinity)
                                }
                            })
                            .sheet(isPresented: $isFontChooserPresented) {
                                FontChooser(fontName: $preferences.indicatorHourTextFontName) {
                                    self.isFontChooserPresented.toggle()
                                }
                            }
                            
                            OptionPicker(option: $preferences.indicatorHourTextFontWeight, label: "Font Weight", systemImage: "bold")
                            
                            PreferenceSlider(value: $preferences.indicatorHourTextFontSizeRatio, label: "Font Size Ratio", systemImage: "textformat.size", minimumValue: 0, maximumValue: 1, step: 0.125, format: "%0.3f")
                        }
                    }
                    
                    DisclosureGroup("Arms") {
                        DisclosureGroup("Hours") {
                            PreferenceSlider(value: $preferences.armHourRadiusRatio, label: "Radius Ratio", systemImage: "arrow.up.backward.and.arrow.down.forward", minimumValue: 0, maximumValue: 1, step: 0.01, format: "%0.2f")
                            PreferenceSlider(value: $preferences.armHourMarginRatio, label: "Margin Ratio", systemImage: "arrow.up.left.and.arrow.down.right.circle", minimumValue: 0, maximumValue: 1, step: 0.2, format: "%0.1f")
                        }
                        
                        DisclosureGroup("Minutes") {
                            PreferenceSlider(value: $preferences.armMinuteRadiusRatio, label: "Radius Ratio", systemImage: "arrow.up.backward.and.arrow.down.forward", minimumValue: 0, maximumValue: 1, step: 0.005, format: "%0.2f")
                            PreferenceSlider(value: $preferences.armMinuteMarginRatio, label: "Margin Ratio", systemImage: "arrow.up.left.and.arrow.down.right.circle", minimumValue: 0, maximumValue: 1, step: 0.25, format: "%0.1f")
                        }
                        
                        DisclosureGroup("Seconds") {
                            PreferenceSlider(value: $preferences.armSecondRadiusRatio, label: "Radius Ratio", systemImage: "arrow.up.backward.and.arrow.down.forward", minimumValue: 0, maximumValue: 1, step: 0.0025, format: "%0.2f")
                            PreferenceSlider(value: $preferences.armSecondMarginRatio, label: "Margin Ratio", systemImage: "arrow.up.left.and.arrow.down.right.circle", minimumValue: 0, maximumValue: 1, step: 0.33, format: "%0.1f")
                        }
                    }
                }

                ShowToggle(isOn: $preferences.showDigitalClock, label: "Show Digital", systemImage: "24.circle")

                if preferences.advancedMode && preferences.showDigitalClock {
                    PreferenceSlider(value: $preferences.padding, label: "Padding", systemImage: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left", minimumValue: 0, maximumValue: maximumPadding, step: 1, format: "%.f")
                }
            }
            .navigationBarTitle("Settings")
            .toolbar {
                Button(action: {
                    $preferences.advancedMode.wrappedValue.toggle()
                }, label: {
                    Text(preferences.advancedMode ? "Basic" : "Advanced")
                })
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(width: 375)
            .environmentObject(ClocksyPreferences())
    }
}
