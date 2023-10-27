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
        let context = LAContext() // 사용자가 기기내에서 인증하는 부분을 다루는 프레임워크 (생체인증과 암호인증이 여기에 해당)
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your app"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    DispatchQueue.main.async {
                        self.isUnlocked = true
                    }
                    //self.isUnlocked = true
                    print("Face ID authentication successful")
                } else {
                    DispatchQueue.main.async {
                        self.isUnlocked = false
                    }
                    //self.isUnlocked = false
                    print("Face ID authentication failed with error")
                }
            }
        } else {
            isUnlocked = false
            print("Face ID not available on this device")
        }
    }
}
