//
//  DigitView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 08/09/2021.
//

import SwiftUI

struct DigitView: View {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    var width: CGFloat
    var padding: CGFloat
    
    var digits: [AnyView] {
        DigitalDigits.digits
    }
    
    var separator: AnyView {
        DigitalDigits.separator
    }
    
    var body: some View {
        let clockWidth: CGFloat = width - (padding * 6)
        let digitWidth: CGFloat = clockWidth / 7
        let separatorWidth: CGFloat = clockWidth / 14
        
        HStack(spacing: 0) {
            ForEach(split(digit: hours), id: \.self) { number in
                digits[number]
                    .frame(width: digitWidth, height: digitWidth * 2)
                    .padding(.horizontal, padding)
            }
            
            separator
                .frame(width: separatorWidth, height: separatorWidth * 2)
            
            ForEach(split(digit: minutes), id: \.self) { number in
                digits[number]
                    .frame(width: digitWidth, height: digitWidth * 2)
                    .padding(.horizontal, padding)
            }
            
            separator
                .frame(width: separatorWidth, height: separatorWidth * 2)
            
            ForEach(split(digit: seconds), id: \.self) { number in
                digits[number]
                    .frame(width: digitWidth, height: digitWidth * 2)
                    .padding(.horizontal, padding)
            }
        }
    }
}

struct DigitView_Previews: PreviewProvider {
    static var previews: some View {
        DigitView(hours: 88, minutes: 88, seconds: 88, width: 300, padding: 2)
    }
}
