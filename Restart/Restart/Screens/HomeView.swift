//
//  HomeView.swift
//  Restart
//
//  Created by Aaron Sutton on 1/12/22.
//

import SwiftUI

struct HomeView: View {
    
  @AppStorage("onboarding") var isOnboardinViewActive: Bool = true
  
    var body: some View {
      VStack(spacing: 20) {
        Text("Home").font(.largeTitle)
        
        Button(action: {
          isOnboardinViewActive = true
        }) {
            Text("Restart")
        }
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
