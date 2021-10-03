//
//  PreferenceSlider.swift
//  Clocksy
//
//  Created by Khaled Chehab on 25/09/2021.
//

import SwiftUI

struct PreferenceSlider: View {
    @Binding var value: Double
    let label: String
    let systemImage: String
    let minimumValue: Double
    let maximumValue: Double
    let step: Double
    let format: String
    
    var range: ClosedRange<Double> {
        minimumValue...maximumValue
    }
    
    var body: some View {
        HStack {
            Label(label, systemImage: systemImage)
            VStack {
                Slider(value: $value, in: range, step: step)
                    .onChange(of: maximumValue) { newValue in
                        value = min(newValue, maximumValue)
                    }
                    .onChange(of: minimumValue) { newValue in
                        value = max(newValue, minimumValue)
                    }
                
                Text(String(format: format, value))
            }
        }
    }
}

struct PreferenceSlider_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceSlider(value: .constant(0), label: "Padding", systemImage: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left", minimumValue: 2, maximumValue: 7, step: 1, format: "%.f")
            .previewLayout(.sizeThatFits)
    }
}
