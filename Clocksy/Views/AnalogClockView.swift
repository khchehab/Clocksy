//
//  AnalogClockView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 28/08/2021.
//

import SwiftUI

struct AnalogClockView: View {
    @Binding var now: Date
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // static components
                BorderView()
                IndicatorView()
                 
                // moving components
                let (hours, minutes, seconds) = getComponents(of: now)
                ArmsView(hours: hours, minutes: minutes, seconds: seconds)
            }
            .frame(width: proxy.circle.width, height: proxy.circle.height)
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            AnalogClockView(now: .constant(Date()))
                .environmentObject(ClocksyPreferences())
        }
    }
}
