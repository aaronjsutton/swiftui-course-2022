//
//  TitleView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct TitleView: View {
  
  var title: String
  
  var body: some View {
    HStack {
      Text(title)
        .font(.largeTitle)
      .fontWeight(.heavy)
    }
    .padding(.horizontal)
    .padding(.top, 15)
    .padding(.bottom, 10)
  }
}

struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView(title: "Helmet")
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
