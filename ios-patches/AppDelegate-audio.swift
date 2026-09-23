// Paste the body of this into ios/App/App/AppDelegate.swift, inside
// application(_:didFinishLaunchingWithOptions:), before `return true`.
// It makes Web Audio play even when the iPhone silent switch is on,
// which the Breathe, Attention switch, Agency clock and Time sense games need.

import AVFoundation

func configureAudioSession() {
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
        try AVAudioSession.sharedInstance().setActive(true)
    } catch {
        print("Audio session error: \(error)")
    }
}
