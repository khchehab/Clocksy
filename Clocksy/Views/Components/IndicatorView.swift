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
    
    private var hourTextIndicator: some IndicatorBaseView {
        ClassicHourTextIndicator(widthRatio: CGFloat(preferences.indicatorHourTextWidthRatio),
                                 borderMarginRatio: CGFloat(preferences.indicatorHourTextBorderMarginRatio),
                                 fontName: preferences.indicatorHourTextFontName,
                                 fontSizeRatio: CGFloat(preferences.indicatorHourTextFontSizeRatio),
                                 fontWeightValue: preferences.indicatorHourTextFontWeight)
    }
    
    private var minuteIndicator: some IndicatorBaseView {
        ClassicIndicator(widthRatio: CGFloat(preferences.indicatorMinuteWidthRatio),
                         borderMarginRatio: CGFloat(preferences.indicatorMinuteBorderMarginRatio))
    }
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(1..<61) { timeDigit in
                if timeDigit % 5 == 0 { // time digit is an hour
                    let hour = timeDigit / 5
                    
                    hourIndicator.content(component: .hours, value: hour, geometry: proxy)
                    hourTextIndicator.content(component: .hours, value: hour, geometry: proxy)
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
