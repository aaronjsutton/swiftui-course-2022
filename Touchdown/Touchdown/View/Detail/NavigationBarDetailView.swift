//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct NavigationBarDetailView: View {
  var body: some View {
    HStack {
      Button(action: {}, label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      })
        
      Spacer() 
      
      Button(action: {}, label: {
        Image(systemName: "cart")
          .font(.title)
          .foregroundColor(.white)
      })
    }
  }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.gray)
  }
}
