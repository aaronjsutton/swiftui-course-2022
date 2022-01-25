//
//  FooterView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct FooterView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      Text("We offer the most cutting edge, lightweight and durable football helmets in the market at affordable prices.")
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
      
      Image("logo-lineal")
        .renderingMode(.template)
        .foregroundColor(.gray)
      
      Text("Copyright © Aaron Sutton\n All rights reserved")
        .font(.footnote)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .layoutPriority(1)
    }
    .padding()
  }
}

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
