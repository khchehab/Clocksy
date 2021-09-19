//
//  IndicatorView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

struct IndicatorView: View {
    @EnvironmentObject var preferences: ClocksyPreferences
    
    // MARK: - Indicator instances as style
    private var hourIndicator: some IndicatorBaseView {
        ClassicIndicator(widthRatio: CGFloat(preferences.indicatorHourWidthRatio),
                         borderMarginRatio: CGFloat(preferences.indicatorHourBorderMarginRatio))
    }
    
    private var hourTextIndicator: some IndicatorTextBaseView {
        ClassicHourTextIndicator()
    }
    
    private var minuteIndicator: some IndicatorBaseView {
        ClassicIndicator(widthRatio: CGFloat(preferences.indicatorMinuteWidthRatio),
                         borderMarginRatio: CGFloat(preferences.indicatorMinuteBorderMarginRatio))
    }
    
    // MARK: - Indicator border margin ratios for each indicator type
    
    private var hourIndicatorTextBorderMarginRatio: CGFloat {
        type(of: hourTextIndicator).indicatorTextBorderMarginRatio
    }
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(1..<61) { timeDigit in
                // time digit is an hour
                if timeDigit % 5 == 0 {
                    let hour = timeDigit / 5
                    let angle = Angle(degrees: Constants.degreesPerHour * Double(hour))
                    
                    hourIndicator.content(component: .hours, value: hour, geometry: proxy)
                    
//                    hourIndicator.content(geometry: proxy)
//                        .position(CGPoint(at: angle,
//                                          in: proxy.circle,
//                                          margin: hourIndicatorBorderMarginRatio * proxy.radius))
                    hourTextIndicator.content(geometry: proxy, display: String(hour))
                        .position(CGPoint(at: angle,
                                          in: proxy.circle,
                                          margin: hourIndicatorTextBorderMarginRatio * proxy.radius))
                } else { // time digit is a minute
                    minuteIndicator.content(component: .minutes, value: timeDigit, geometry: proxy)
                }
            }
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView()
            .environmentObject(ClocksyPreferences())
    }
}
