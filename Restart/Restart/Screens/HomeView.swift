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
        Spacer()
        
        ZStack {
          CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
          
          Image("character-2")
            .resizable()
            .scaledToFit()
          .padding()
        }
        
        Text("The time that leads to mastery is depdendent on the intensity of our focus")
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding()
        
        Spacer()
    
        Button(action: {
          isOnboardinViewActive = true
        }) {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .imageScale(.large)
          Text("Restart")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
        }
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.capsule)
          .controlSize(.large)
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
