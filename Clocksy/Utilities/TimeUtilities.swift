//
//  TimeUtilities.swift
//  Clocksy
//
//  Created by Khaled Chehab on 30/08/2021.
//

import SwiftUI

enum TimeComponent {
    case hours, minutes, seconds
}

func getComponents(of date: Date) -> (hour: Int, minute: Int, second: Int) {
    let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
    var hour = dateComponents.hour!
    
    if hour > 12 {
        hour -= 12
    }
    
    let minute = dateComponents.minute!
    let second = dateComponents.second!
    return (hour, minute, second)
}

func angle(hour: Double? = nil, minute: Double? = nil, second: Double? = nil) -> Angle {
    var degrees: Double = 0
    
    if let second = second, minute == nil, hour == nil {
        degrees = second * Constants.degreesPerMinute
    }
    
    if let second = second, let minute = minute, hour == nil {
        degrees = (minute + (second / Constants.minutesInHour)) * Constants.degreesPerMinute
    }
    
    if let second = second, let minute = minute, let hour = hour {
        degrees = (hour + (minute / Constants.minutesInHour) + (second / Constants.secondsInHour)) * Constants.degreesPerHour
    }
    
    return Angle(degrees: degrees)
}

func split(digit: Int) -> [Int] {
    return String(format: "%02d", digit).compactMap { $0.wholeNumberValue }
}
