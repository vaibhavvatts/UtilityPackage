//
//  AudioManager.swift

//
//  Created by Vaibhav kumar on 02/05/21.
//

import Foundation
import SwiftUI
import AVFoundation

public class AudioManager {
    public static let shared = AudioManager()
    
    private init() {}
    
    private var audioPlayer: AVAudioPlayer?
    
    public func playSound(for soundFileName: String) {
        stopSound()
        playSound(by: soundFileName)
    }
    
    private func playSound(by name: String, with ext: String = "mp3") {
        if let url = Bundle.main.url(forResource: name, withExtension: ext) {
            do {
                let session = AVAudioSession.sharedInstance()
                try? session.setCategory(.playback)
                try? session.setActive(true, options: .notifyOthersOnDeactivation)
                
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                audioPlayer?.numberOfLoops = 1
                audioPlayer?.play()
            } catch {
//                AnalyticsWrapper.logEvent(AnalyticsConst.Reminder.playError)
            }
        }
    }
    
    public func pauseSound() {
        audioPlayer?.pause()
    }
    
    public func stopSound() {
        audioPlayer?.stop()
    }
}
