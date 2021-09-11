//
//  ArmView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 03/09/2021.
//

import SwiftUI

struct ArmView: View {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    var body: some View {
        GeometryReader { proxy in
            // seconds arm
            ClassicArm(center: proxy.center, radius: 1, margin: 130)
                .rotation(angle(second: Double(seconds)))
            
            // minutes arm
            ClassicArm(center: proxy.center, radius: 2, margin: 120)
                .rotation(angle(minute: Double(minutes), second: Double(seconds)))
            
            // hours arm
            ClassicArm(center: proxy.center, radius: 4, margin: 80)
                .rotation(angle(hour: Double(hours), minute: Double(minutes), second: Double(seconds)))
        }
    }
}

struct ArmView_Previews: PreviewProvider {
    static var previews: some View {
        ArmView(hours: 1, minutes: 15, seconds: 30)
    }
}
