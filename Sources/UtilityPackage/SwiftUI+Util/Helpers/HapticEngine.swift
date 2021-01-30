//
//  HapticEngine.swift
//  HabitsTracker
//
//  Created by Vaibhav on 16/11/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
open class HapticEngine {
    class public func generate(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactOccured(for: impactFeedbackgenerator)
    }
    
    class private func impactOccured(for gen: UIImpactFeedbackGenerator) {
        gen.prepare()
        gen.impactOccurred()
    }
    
    class public func generateSoftHaptic() {
        HapticEngine.generate(.soft)
    }
}
