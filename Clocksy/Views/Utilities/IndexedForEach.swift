//
//  IndexedForEach.swift
//  Clocksy
//
//  Created by Khaled Chehab on 03/10/2021.
//

import SwiftUI

struct IndexedForEach<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View {
    private struct IndexedElement<Index, Element, ID> {
        let id: KeyPath<Element, ID>
        let index: Index
        let element: Element
        
        var elementId: ID {
            element[keyPath: id]
        }
    }
    
    var data: Data
    var id: KeyPath<Data.Element, ID>
    var content: (Data.Index, Data.Element) -> Content
    
    init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Index, Data.Element) -> Content) {
        self.data = data
        self.id = id
        self.content = content
    }
    
    var body: some View {
        ForEach(zip(data.indices, data).compactMap { IndexedElement(id: id, index: $0, element: $1) }, id: \.elementId) { indexedElement in
            content(indexedElement.index, indexedElement.element)
        }
    }
}
