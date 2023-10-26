//
//  ContentView.swift
//  FaceIDTest
//
//  Created by 안병욱의 mac on 2023/10/26.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @State private var isUnlocked = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    DispatchQueue.main.async {
                        isUnlocked = true
                    }
                } else {
                    // there was a problem
                    DispatchQueue.main.async {
                        isUnlocked = false
                    }
                }
            }
        } else {
            // no biometrics
            isUnlocked = false
        }
    }
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked screen")
            } else {
                Text("Locked screen")
            }
            
            Button(action: {
                authenticate()
            }) {
                Text("Authenticate with Face ID")
            }
        }
        .padding()
    }
}
