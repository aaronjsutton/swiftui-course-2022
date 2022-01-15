//
//  AudioPlayer.swift
//  Restart
//
//  Created by Aaron Sutton on 1/14/22.
//

import AVFoundation
import Foundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Fatal: Could not play sound file.")
    }
  }
}
