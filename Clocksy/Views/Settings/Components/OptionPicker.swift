//
//  OptionPicker.swift
//  Clocksy
//
//  Created by Khaled Chehab on 26/09/2021.
//

import SwiftUI

struct OptionPicker<T: RawRepresentable & CaseIterable & Hashable>: View where T.RawValue == String, T.AllCases: RandomAccessCollection {
    @Binding var option: T
    let label: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: systemImage)
            Picker(option.rawValue.localizedCapitalized, selection: $option) {
                ForEach(T.allCases, id: \.self) {
                    Text($0.rawValue.localizedCapitalized)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(maxWidth: .infinity)
        }
    }
}

struct OptionPicker_Previews: PreviewProvider {
    static var previews: some View {
        OptionPicker(option: .constant(ClockStyle.classic), label: "Style", systemImage: "paintpalette")
            .previewLayout(.sizeThatFits)
    }
}
