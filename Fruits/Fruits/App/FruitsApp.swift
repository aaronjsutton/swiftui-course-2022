//
//  FruitsApp.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/15/22.
//

import SwiftUI

@main
struct FruitsApp: App {
  
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnboardingView()
      } else {
        ContentView()
      }
    }
  }
}
