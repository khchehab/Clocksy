//
//  DigitalClockView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 08/09/2021.
//

import SwiftUI

struct DigitalClockView: View {
    @EnvironmentObject var preferences: ClocksyPreferences
    @Binding var now: Date
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let padding = CGFloat(preferences.paddingRatio) * width
            let (hours, minutes, seconds) = getComponents(of: now)
            DigitView(hours: hours, minutes: minutes, seconds: seconds, width: width - (padding * 6), padding: padding)
                .frame(width: width)
        }
    }
}

struct DigitalClockView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalClockView(now: .constant(Date()))
            .environmentObject(ClocksyPreferences())
    }
}
