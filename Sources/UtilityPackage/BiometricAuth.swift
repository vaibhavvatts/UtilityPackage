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
    
    public func authenticateUserByPassword(completion: @escaping (String?, Error?) -> Void) {
        self.context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: self.loginReason) { (success, evaluateError) in
            if success {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            }else {
                
                let message: String
                
                switch evaluateError {
                case LAError.authenticationFailed?:
                    message = "There was a problem verifying your identity."
                case LAError.userCancel?:
                    message = " " // user pressed cancel
                case LAError.userFallback?:
                    message = "Biometric didn't work."
                case LAError.biometryNotAvailable?:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                case LAError.biometryNotEnrolled?:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                case LAError.biometryLockout?:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                default:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                }
                
                completion(message, evaluateError)
            }
        }
    }
    
    public func authenticateUser(completion: @escaping (String?, Error?) -> Void) {
        
        guard canEvaluatePolicy else {
            completion("Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes.", nil)
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: loginReason) { (success, evaluateError) in
            if success {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            } else {
                
                let message: String
                
                switch evaluateError {
                case LAError.authenticationFailed?:
                    message = "There was a problem verifying your identity."
                case LAError.userCancel?:
                    message = " " // user pressed cancel
                case LAError.userFallback?:
                    message = "Biometric didn't work."
                case LAError.biometryNotAvailable?:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                case LAError.biometryNotEnrolled?:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                case LAError.biometryLockout?:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                default:
                    message = "Face ID/ Touch ID could not be accessed. Enable it and set-up passcode from settings to access your secret notes."
                }
                
                completion(message, evaluateError)
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
