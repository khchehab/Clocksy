//
//  ShowToggle.swift
//  Clocksy
//
//  Created by Khaled Chehab on 25/09/2021.
//

import SwiftUI

struct ShowToggle: View {
    @Binding var isOn: Bool
    let label: String
    let systemImage: String
    
    var body: some View {
        Toggle(isOn: $isOn, label: {
            Label(label, systemImage: systemImage)
        })
    }
}

struct ShowToggle_Previews: PreviewProvider {
    static var previews: some View {
        ShowToggle(isOn: .constant(true), label: "Show Analog", systemImage: "clock")
            .previewLayout(.sizeThatFits)
    }
}
