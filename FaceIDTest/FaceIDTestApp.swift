//
//  FaceIDTestApp.swift
//  FaceIDTest
//
//  Created by 안병욱의 mac on 2023/10/26.
//

import SwiftUI

@main
struct FaceIDTestApp: App {
    var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
