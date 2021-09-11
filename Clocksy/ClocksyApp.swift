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
    private let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    let padding: CGFloat = 2
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                VStack {
                    AnalogClockView(now: $now, rect: proxy.circle)
                    DigitalClockView(now: $now, width: proxy.size.width, padding: padding)
                }
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
