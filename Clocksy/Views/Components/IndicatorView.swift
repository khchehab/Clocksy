//
//  IndicatorView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 01/09/2021.
//

import SwiftUI

struct IndicatorView: View {
    // MARK: - Indicator instances as style
    private var hourIndicator: some IndicatorBaseView {
        ClassicHourIndicator()
    }
    
    private var hourTextIndicator: some IndicatorTextBaseView {
        ClassicHourTextIndicator()
    }
    
    private var minuteIndicator: some IndicatorBaseView {
        ClassicMinuteIndicator()
    }
    
    // MARK: - Indicator border margin ratios for each indicator type
    private var hourIndicatorBorderMarginRatio: CGFloat {
        type(of: hourIndicator).indicatorBorderMarginRatio
    }
    
    private var hourIndicatorTextBorderMarginRatio: CGFloat {
        type(of: hourTextIndicator).indicatorTextBorderMarginRatio
    }
    
    private var minuteIndicatorBorderMarginRatio: CGFloat {
        type(of: minuteIndicator).indicatorBorderMarginRatio
    }
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(1..<61) { timeDigit in
                // time digit is an hour
                if timeDigit % 5 == 0 {
                    let hour = timeDigit / 5
                    let angle = Angle(degrees: Constants.degreesPerHour * Double(hour))
                    
                    hourIndicator.content(geometry: proxy)
                        .position(CGPoint(at: angle,
                                          in: proxy.circle,
                                          margin: hourIndicatorBorderMarginRatio * proxy.radius))
                    hourTextIndicator.content(geometry: proxy, display: String(hour))
                        .position(CGPoint(at: angle,
                                          in: proxy.circle,
                                          margin: hourIndicatorTextBorderMarginRatio * proxy.radius))
                } else { // time digit is a minute
                    let angle = Angle(degrees: Constants.degreesPerMinute * Double(timeDigit))
                    
                    minuteIndicator.content(geometry: proxy)
                        .position(CGPoint(at: angle,
                                          in: proxy.circle,
                                          margin: minuteIndicatorBorderMarginRatio * proxy.radius))
                }
            }
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView()
    }
}
