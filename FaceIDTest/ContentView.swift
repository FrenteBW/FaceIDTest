//
//  ContentView.swift
//  FaceIDTest
//
//  Created by 안병욱의 mac on 2023/10/26.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.isUnlocked {
                Form {
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                    Text("Secret Data")
                }
            } else {
                Image(systemName: "lock.fill")
                Button(action: {
                    viewModel.FaceID()
                }) {
                    Text("Authenticate with Face ID")
                }
            }
        }
    }
}
