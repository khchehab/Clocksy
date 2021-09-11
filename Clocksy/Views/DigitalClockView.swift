//
//  DigitalClockView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 08/09/2021.
//

import SwiftUI

struct DigitalClockView: View {
    @Binding var now: Date
    var width: CGFloat
    var padding: CGFloat
    
    var body: some View {
        let (hours, minutes, seconds) = getComponents(of: now)
        DigitView(hours: hours, minutes: minutes, seconds: seconds, width: width - (padding * 6), padding: padding)
            .frame(width: width)
    }
}

struct DigitalClockView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalClockView(now: .constant(Date()), width: 300, padding: 2)
    }
}
