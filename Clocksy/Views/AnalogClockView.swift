//
//  AnalogClockView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 28/08/2021.
//

import SwiftUI

struct AnalogClockView: View {
    @Binding var now: Date
    var size: CGSize
    
    var body: some View {
        ZStack {
            // static components
            BorderView()
            IndicatorView()
             
            // moving components
            let (hours, minutes, seconds) = getComponents(of: now)
            ArmsView(hours: hours, minutes: minutes, seconds: seconds)
        }
        .frame(width: size.width, height: size.height)
    }
}

struct AnalogClockView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            AnalogClockView(now: .constant(Date()), size: proxy.circle.size)
                .environmentObject(ClocksyPreferences())
        }
    }
}
