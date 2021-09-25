//
//  RatioSlider.swift
//  Clocksy
//
//  Created by Khaled Chehab on 25/09/2021.
//

import SwiftUI

struct RatioSlider: View {
    @Binding var ratio: Double
    let label: String
    let systemImage: String
    let range: ClosedRange<Double>
    let step: Double
    let format: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: systemImage)
            VStack {
                Slider(value: $ratio, in: range, step: step)
                Text(String(format: format, ratio))
            }
        }
    }
}

struct RatioSlider_Previews: PreviewProvider {
    static var previews: some View {
        RatioSlider(ratio: .constant(0.005), label: "Padding Ratio", systemImage: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left", range: 0...1, step: 0.005, format: "%0.3f")
            .previewLayout(.sizeThatFits)
    }
}
