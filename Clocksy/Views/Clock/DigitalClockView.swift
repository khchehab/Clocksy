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
    var size: CGSize
    
    var body: some View {
        let (hours, minutes, seconds) = getComponents(of: now)
        DigitsView(hours: hours, minutes: minutes, seconds: seconds, width: size.width, padding: CGFloat(preferences.padding))
    }
}

struct DigitalClockView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            DigitalClockView(now: .constant(Date()), size: proxy.size)
                .environmentObject(ClocksyPreferences())
        }
    }
}
