//
//  OnboardingView.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/19/22.
//

import SwiftUI

struct OnboardingView: View {
  
    var fruits: [Fruit] = fruitsData
  
    var body: some View {
      TabView {
        ForEach(fruits[0...5]) { fruit in
          FruitCardView(fruit: fruit)
        }
      }
      .tabViewStyle(PageTabViewStyle())
      .padding(.vertical, 20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
