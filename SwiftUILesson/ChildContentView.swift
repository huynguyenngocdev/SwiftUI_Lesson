//
//  ChidleContentView.swift
//  SwiftUILesson
//
//  Created by Huy_NGUYEN on 30/06/2023.
//

import SwiftUI

struct ChildContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
//    @Binding var counter: Int
    var body: some View {
        VStack {
            Text("Child View! \(viewModel.counter)")
        }
    }
}
