//
//  ArmsView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 03/09/2021.
//

import SwiftUI

struct ArmsView: View {
    @EnvironmentObject var preferences: ClocksyPreferences
    
    // MARK: - Arm instances per style
    private var hourArm: some ArmBaseView {
        ClassicArm(radiusRatio: CGFloat(preferences.armHourRadiusRatio),
                   marginRatio: CGFloat(preferences.armHourMarginRatio))
    }
    
    private var minuteArm: some ArmBaseView {
        ClassicArm(radiusRatio: CGFloat(preferences.armMinuteRadiusRatio),
                   marginRatio: CGFloat(preferences.armMinuteMarginRatio))
    }
    
    private var secondArm: some ArmBaseView {
        ClassicArm(radiusRatio: CGFloat(preferences.armSecondRadiusRatio),
                   marginRatio: CGFloat(preferences.armSecondMarginRatio))
    }
    
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    var hoursAngle: Angle {
        angle(hour: Double(hours), minute: Double(minutes), second: Double(seconds))
    }
    var minutesAngle: Angle {
        angle(minute: Double(minutes), second: Double(seconds))
    }
    var secondsAngle: Angle {
        angle(second: Double(seconds))
    }
    
    var body: some View {
        GeometryReader { proxy in
            secondArm.content(at: secondsAngle, geometry: proxy)
            minuteArm.content(at: minutesAngle, geometry: proxy)
            hourArm.content(at: hoursAngle, geometry: proxy)
        }
    }
}

struct ArmsView_Previews: PreviewProvider {
    static var previews: some View {
        ArmsView(hours: 1, minutes: 15, seconds: 30)
            .environmentObject(ClocksyPreferences())
    }
}
