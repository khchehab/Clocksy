//
//  FontChooser.swift
//  Clocksy
//
//  Created by Khaled Chehab on 26/09/2021.
//

import SwiftUI

struct FontChooser: View {
    @Binding var fontName: String
    var selection: (() -> Void)?
    
    var body: some View {
        List {
            ForEach(UIFont.familyNames, id: \.self) { family in
                Section(header: Text(family)) {
                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self) { font in
                        Button(action: {
                            fontName = font
                            selection?()
                        }, label: {
                            if fontName == font {
                                Label(font, systemImage: "checkmark")
                            } else {
                                Text(font)
                            }
                        })
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct FontChooser_Previews: PreviewProvider {
    static var previews: some View {
        FontChooser(fontName: .constant("HelveticaNeue"))
    }
}
