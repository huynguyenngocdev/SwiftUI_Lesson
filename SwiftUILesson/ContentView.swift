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
    @StateObject var viewModel = AppViewModel()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Hi")
                }
                .background(.red)
                .frame(width: 200, height: 100)
                
                ChildContentView()
                Image(systemName: "hand.wave")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .rotationEffect(.degrees(isActiveAnimation ? 0 : 30),
                                    anchor: .bottomTrailing
                    )
                    .animation(.easeInOut.repeatForever(autoreverses: true),
                               value: isActiveAnimation)
            }
            .environmentObject(viewModel)
            Text("This is a simple counter! \(counter)")
            Stepper {
                Text("Value: \(viewModel.counter)")
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            .padding(5.0)
            Button("Reset", action: {
                reset() {
                    viewModel.counter = $0
                }
                
            })
            .buttonStyle(.borderedProminent)
        }
        .onReceive(viewModel.$counter, perform: { newValue in
            //            counter = viewModel.counter
            print("Upldate vm \(newValue)")
        })
        .onChange(of: counter, perform: {
            print("Update self counter \($0)")
            //            viewModel.counter = counter
        })
        .padding()
        .onAppear {
            isActiveAnimation.toggle()
        }
    }
}

extension ContentView {
    func incrementStep() {
        //        viewModel.counter += 1
        counter += 1
    }
    
    
    func decrementStep() {
        viewModel.counter -= 1
    }
    
    func reset(complete: @escaping (Int) -> ()) {
        
        complete(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
