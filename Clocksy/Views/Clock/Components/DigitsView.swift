//
//  DigitsView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 08/09/2021.
//

import SwiftUI

struct DigitsView: View {
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
        // the separator width is half the digit width
        let totalPadding = padding * 5.0
        let digitWidth = (width - totalPadding) / 7.0
        let separatorWidth = digitWidth / 2.0
        
        HStack(spacing: 0) {
            ForEach(split(digit: hours), id: \.self) { number in
                digits[number]
                    .frame(width: digitWidth, height: digitWidth * 2)
                    .padding(.leading, padding)
            }
            
            separator
                .frame(width: separatorWidth, height: separatorWidth * 2)
            
            IndexedForEach(split(digit: minutes), id: \.self) { index, number in
                digits[number]
                    .frame(width: digitWidth, height: digitWidth * 2)
                    .padding(.trailing, index == 0 ? padding : 0)
            }
            
            separator
                .frame(width: separatorWidth, height: separatorWidth * 2)
            
            ForEach(split(digit: seconds), id: \.self) { number in
                digits[number]
                    .frame(width: digitWidth, height: digitWidth * 2)
                    .padding(.trailing, padding)
            }
        }
//        .frame(width: width, height: width / 2)
    }
}

struct DigitsView_Previews: PreviewProvider {
    static var previews: some View {
        DigitsView(hours: 88, minutes: 88, seconds: 88, width: 375, padding: 6)
        
        if #available(iOS 15.0, *) {
            DigitsView(hours: 88, minutes: 88, seconds: 88, width: 724, padding: 0)
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
