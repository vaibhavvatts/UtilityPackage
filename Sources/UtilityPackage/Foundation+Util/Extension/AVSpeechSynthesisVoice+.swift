//
//  File.swift
//  
//
//  Created by Vaibhav kumar on 12/25/21.
//

import Foundation
import AVKit

public extension AVSpeechSynthesisVoice {
    var displayGender: String {
        switch gender {
        case .male:
            return "Male"
        case .female:
            return "Female"
        default:
            return "Unspecified"
        }
    }
    
    static var printAllVoices: Void {
        AVSpeechSynthesisVoice.speechVoices().forEach {
            print($0)
        }
    }
    
    static var getDefaultVoiceIdentifier: String {
        AVSpeechSynthesisVoice(language: AVSpeechSynthesisVoice.currentLanguageCode())?.identifier ?? "com.apple.ttsbundle.Samantha-compact"
    }
}

public extension String {
    var getSpeechSynthVoiceName: String { // requires identifier
        AVSpeechSynthesisVoice(identifier: self)?.name ?? "Unspecified"
    }
    
    var getSpeechSynthVoiceGender: String { // requires identifier
        AVSpeechSynthesisVoice(identifier: self)?.displayGender ?? "Unspecified"
    }
    
    var getSpeechSynthVoiceLanguageCode: String { // requires identifier
        AVSpeechSynthesisVoice(identifier: self)?.language ?? "en-US"
    }
    
    var getPreferredVoice: AVSpeechSynthesisVoice? {
        AVSpeechSynthesisVoice(identifier: self)
    }
}
