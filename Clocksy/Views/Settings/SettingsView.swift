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
    
    var body: some View {
        NavigationView {
            List {
                OptionPicker(option: $preferences.style, label: "Style", systemImage: "paintpalette")

                ShowToggle(isOn: $preferences.showAnalogClock, label: "Show Analog", systemImage: "clock")

                if preferences.advancedMode && preferences.showAnalogClock {
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
                            
                            RatioSlider(ratio: $preferences.indicatorHourTextFontSizeRatio, label: "Font Size Ratio", systemImage: "textformat.size", range: 0...1, step: 0.125, format: "%0.3f")
                        }
                    }
                    
                    DisclosureGroup("Arms") {
                        DisclosureGroup("Hours") {
                            RatioSlider(ratio: $preferences.armHourRadiusRatio, label: "Radius Ratio", systemImage: "arrow.up.backward.and.arrow.down.forward", range: 0...1, step: 0.01, format: "%0.2f")
                            RatioSlider(ratio: $preferences.armHourMarginRatio, label: "Margin Ratio", systemImage: "arrow.up.left.and.arrow.down.right.circle", range: 0...1, step: 0.2, format: "%0.1f")
                        }
                        
                        DisclosureGroup("Minutes") {
                            RatioSlider(ratio: $preferences.armMinuteRadiusRatio, label: "Radius Ratio", systemImage: "arrow.up.backward.and.arrow.down.forward", range: 0...1, step: 0.005, format: "%0.2f")
                            RatioSlider(ratio: $preferences.armMinuteMarginRatio, label: "Margin Ratio", systemImage: "arrow.up.left.and.arrow.down.right.circle", range: 0...1, step: 0.25, format: "%0.1f")
                        }
                        
                        DisclosureGroup("Seconds") {
                            RatioSlider(ratio: $preferences.armSecondRadiusRatio, label: "Radius Ratio", systemImage: "arrow.up.backward.and.arrow.down.forward", range: 0...1, step: 0.0025, format: "%0.2f")
                            RatioSlider(ratio: $preferences.armSecondMarginRatio, label: "Margin Ratio", systemImage: "arrow.up.left.and.arrow.down.right.circle", range: 0...1, step: 0.33, format: "%0.1f")
                        }
                    }
                }

                ShowToggle(isOn: $preferences.showDigitalClock, label: "Show Digital", systemImage: "24.circle")

                if preferences.advancedMode && preferences.showDigitalClock {
                    RatioSlider(ratio: $preferences.paddingRatio, label: "Padding Ratio", systemImage: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left", range: 0...1, step: 0.005, format: "%0.3f")
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
        SettingsView()
            .environmentObject(ClocksyPreferences())
    }
}
