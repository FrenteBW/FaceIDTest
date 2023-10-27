//
//  ViewModel.swift
//  FaceIDTest
//
//  Created by 안병욱의 mac on 2023/10/27.
//

import Foundation
import LocalAuthentication

class ViewModel: ObservableObject {
    
    @Published var isUnlocked: Bool = false
    
    func FaceID() {
        let context = LAContext() //deals with the parts that the user authenticates
        var error: NSError?
        
        //check if biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "We need to unlock your app"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    DispatchQueue.main.async {
                        self.isUnlocked = true
                    }
                    print("Face ID authentication successful")
                } else {
                    DispatchQueue.main.async {
                        self.isUnlocked = false
                    }
                    print("Face ID authentication failed with error")
                }
            }
        } else {
            isUnlocked = false
            print("Face ID not available on this device")
        }
    }
}
