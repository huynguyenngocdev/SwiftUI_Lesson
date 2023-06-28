//
//  AppViewModel.swift
//  SwiftUILesson
//
//  Created by Huy_NGUYEN on 28/06/2023.
//

import SwiftUI
import CoreBluetooth

class AppViewModel:NSObject, ObservableObject {
    @Published var counter: Int
    
    override init() {
        self.counter = 0
    }
}
