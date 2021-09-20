//
//  SettingsView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var preferences: ClocksyPreferences = ClocksyPreferences()
    
    var body: some View {
        VStack {
            Picker("Style", selection: $preferences.style) {
                ForEach(ClockStyle.allCases, id: \.self) { style in
                    Text(style.rawValue.localizedCapitalized)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Text("Selected Style: \(preferences.style.rawValue)")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ClocksyPreferences())
    }
}
