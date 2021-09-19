//
//  ClocksyApp.swift
//  Clocksy
//
//  Created by Khaled Chehab on 28/08/2021.
//

import SwiftUI

@main
struct ClocksyApp: App {
    @State private var now = Date()
    @StateObject var preferences = ClocksyPreferences()
    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                VStack {
                    if preferences.showAnalogClock {
                        AnalogClockView(now: $now, size: proxy.circle.size)
                    }
                    
                    if preferences.showDigitalClock {
                        DigitalClockView(now: $now, size: proxy.size)
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
}
