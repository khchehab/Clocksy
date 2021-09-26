//
//  ClockView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 26/09/2021.
//

import SwiftUI

struct ClockView: View {
    @EnvironmentObject var preferences: ClocksyPreferences
    @Binding var now: Date
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                VStack {
                    if preferences.showAnalogClock {
                        AnalogClockView(now: $now, size: proxy.circle.size)
                    }
                    
                    if preferences.showDigitalClock {
                        DigitalClockView(now: $now, size: proxy.size)
                    }
                }
            }
            .navigationBarTitle("Clock")
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(now: .constant(Date()))
            .environmentObject(ClocksyPreferences())
    }
}
