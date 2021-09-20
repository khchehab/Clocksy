//
//  ClocksyView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 19/09/2021.
//

import SwiftUI

struct ClocksyView: View {
    @State private var currentTab: ClocksyTab = .settings
    @State private var now: Date = Date()
    @StateObject var preferences: ClocksyPreferences = ClocksyPreferences()
    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                TabView(selection: $currentTab) {
                    VStack {
                        if preferences.showAnalogClock {
                            AnalogClockView(now: $now, size: proxy.circle.size)
                        }
                        
                        if preferences.showDigitalClock {
                            DigitalClockView(now: $now, size: proxy.size)
                        }
                    }
                    .tag(ClocksyTab.clock)
                    .tabItem {
                        Label(ClocksyTab.clock.rawValue, systemImage: "clock")
                    }
                    SettingsView()
                        .tag(ClocksyTab.settings)
                        .tabItem {
                            Label(ClocksyTab.settings.rawValue, systemImage: "gear")
                        }
                }
            }
            .environmentObject(preferences)
            .onReceive(timer) { time in
                self.now = time
            }
            .onDisappear {
                self.timer.upstream.connect().cancel()
            }
        }
    }
}

struct ClocksyView_Previews: PreviewProvider {
    static var previews: some View {
        ClocksyView()
            .environmentObject(ClocksyPreferences())
    }
}
