//
//  FruitHeaderView.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/19/22.
//

import SwiftUI

struct FruitHeaderView: View {
  var fruit: Fruit
  
  @State private var isAnimatingImage: Bool = false
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomLeading)
      
      Image(fruit.image)
        .resizable()
        .scaledToFit()
        .shadow(color: Color(white: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
        .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
    }
    .frame(height: 440)
    .onAppear() {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimatingImage = true
      }
    }
  }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      FruitHeaderView(fruit: fruitsData[0])
        .previewLayout(.fixed(width: 375, height: 440))
    }
}
