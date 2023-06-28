//
//  DemoGrid.swift
//  SwiftUILesson
//
//  Created by Huy_NGUYEN on 28/06/2023.
//

import SwiftUI

struct DemoVGridView: View {
    let data = (1...100).map { "Item \($0)" }
    
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    let columns: [GridItem] = {
        var termColumns: [GridItem] = []
        for i in 0..<100 {
            termColumns.append(.init(.flexible()))
        }
        return termColumns
    }()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 300)
    }
}

struct DemoHGridView: View {
    let items = 1...50
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.self) { item in
                    Image(systemName: "\(item).circle.fill")
                        .foregroundColor(Color("Red"))
                        .font(.largeTitle)
                }
            }
            .frame(height: 150)
        }
    }
}

struct DemoGridView_Previews: PreviewProvider {
    static var previews: some View {
//        DemoVGridView()
                DemoHGridView()
    }
}

