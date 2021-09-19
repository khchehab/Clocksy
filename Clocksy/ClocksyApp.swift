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
            VStack {
                AnalogClockView(now: $now)
                DigitalClockView(now: $now)
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
