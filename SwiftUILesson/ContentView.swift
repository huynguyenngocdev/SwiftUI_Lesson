//
//  ContentView.swift
//  SwiftUILesson
//
//  Created by Huy_NGUYEN on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var isActiveAnimation = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Hi")
                Image(systemName: "hand.wave")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .rotationEffect(.degrees(isActiveAnimation ? 0 : 30),
                                    anchor: .bottomTrailing
                    )
                    .animation(.easeInOut.repeatForever(autoreverses: true),
                               value: isActiveAnimation)
            }
            Text("This is a simple counter!")
            Stepper {
                Text("Value: \(counter)")
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            .padding(5)
            Button("Reset", action: {reset()})
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            isActiveAnimation.toggle()
        }
    }
}

extension ContentView {
    func incrementStep() {
        counter += 1
    }
    
    
    func decrementStep() {
        counter -= 1
    }
    
    func reset() {
        counter = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
