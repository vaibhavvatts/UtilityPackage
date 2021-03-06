//
//  Authentication.swift
//  JotDown
//
//  Created by Vaibhav on 01/02/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import Foundation
import LocalAuthentication

public enum BiometricType {
    case none
    case touchID
    case faceID
}

@available(iOS 13, *)
open class BiometricIDAuth {
    public static let shared = BiometricIDAuth()
    private init() {}
    
    var loginReason = "Logging in with Touch ID / Face ID"
    
    let context = LAContext()
    
    var getLockSystemIcon: String {
        switch biometricType() {
        case .faceID:
            return "faceid"
        default:
            return "lock.fill"
        }
    }
    
    public func authenticateUserByPassword(completion: @escaping (String?) -> Void) {
        self.context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: self.loginReason) { (success, evaluateError) in
            if success {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }else {
                
                let message: String
                
                switch evaluateError {
                case LAError.authenticationFailed?:
                    message = "There was a problem verifying your identity."
                case LAError.userCancel?:
                    message = "You pressed cancel."
                case LAError.userFallback?:
                    message = "Biometric didn't work."
                case LAError.biometryNotAvailable?:
                    message = "Face ID/Touch ID is not available. You may need to go to settings to enabled it."
                case LAError.biometryNotEnrolled?:
                    message = "Face ID/Touch ID is not set up. You may need to go to settings to enabled it."
                case LAError.biometryLockout?:
                    message = "Face ID/Touch ID is locked. You may need to go to settings to enabled it."
                default:
                    message = "Face ID/Touch ID may not be configured. You may need to go to settings to enabled it."
                }
                
                completion(message)
            }
        }
    }
    
    public func authenticateUser(completion: @escaping (String?) -> Void) {
        
        guard canEvaluatePolicy else {
            completion("Face ID or Touch ID not available. You may need to go to settings to enabled it.")
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: loginReason) { (success, evaluateError) in
            if success {
                DispatchQueue.main.async {
                    completion(nil)
                }
            } else {
                
                let message: String
                
                switch evaluateError {
                case LAError.authenticationFailed?:
                    message = "There was a problem verifying your identity."
                case LAError.userCancel?:
                    message = "You pressed cancel."
                case LAError.userFallback?:
                    message = "Biometric didn't work."
                case LAError.biometryNotAvailable?:
                    message = "Face ID/Touch ID is not available. You may need to go to settings to enabled it."
                case LAError.biometryNotEnrolled?:
                    message = "Face ID/Touch ID is not set up. You may need to go to settings to enabled it."
                case LAError.biometryLockout?:
                    message = "Face ID/Touch ID is locked. You may need to go to settings to enabled it."
                default:
                    message = "Face ID/Touch ID may not be configured. You may need to go to settings to enabled it."
                }
                
                completion(message)
            }
        }
    }
    
    public var canEvaluatePolicy: Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    public func biometricType() -> BiometricType {
        let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)  // imp don't remove
        switch context.biometryType {
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        default:
            return .none
        }
    }
    
    
}
