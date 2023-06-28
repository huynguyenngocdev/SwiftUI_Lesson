//
//  DemoGrid.swift
//  SwiftUILesson
//
//  Created by Huy_NGUYEN on 28/06/2023.
//

import SwiftUI

struct DemoVStack: View {
    var body: some View {
        VStack {
            ItemView(name: "1")
            ItemView(name: "2")
            ItemView(name: "3")
            ItemView(name: "4")
        }
    }
}

struct DemoVStack_Previews: PreviewProvider {
    static var previews: some View {
        DemoVStack()
    }
}
