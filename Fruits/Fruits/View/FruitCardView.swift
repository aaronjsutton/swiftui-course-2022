//
//  FruitCardView.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/19/22.
//

import SwiftUI

struct FruitCardView: View {
  
  @State private var isAnimating: Bool = false
  
  var fruit: Fruit
  
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        Image(fruit.image)
          .resizable()
          .scaledToFit()
          .shadow(color: Color(white: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
          .scaleEffect(isAnimating ? 1.0 : 0.6)
        
        // TITLE
        Text(fruit.title)
          .foregroundColor(.white)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .shadow(color: Color(white: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
        
        // HEADLINE
        Text(fruit.headline)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
          .frame(maxWidth: 480)
        
        StartButtonView()
      }
    }
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimating = true
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
    .cornerRadius(20)
    .padding(.horizontal, 20)
  }
}

struct FruitCardView_Previews: PreviewProvider {
  static var previews: some View {
    FruitCardView(fruit: fruitsData[5]).previewLayout(.fixed(width: 320, height: 640))
  }
}
