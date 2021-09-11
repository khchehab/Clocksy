//
//  BorderView.swift
//  Clocksy
//
//  Created by Khaled Chehab on 30/08/2021.
//

import SwiftUI

// MARK: - Border View

struct BorderView: View {
    private var border: some BorderBaseView {
        ClassicBorder()
    }
    
    var body: some View {
        GeometryReader(content: border.content)
    }
}

struct BorderView_Previews: PreviewProvider {
    static var previews: some View {
        BorderView()
    }
}
