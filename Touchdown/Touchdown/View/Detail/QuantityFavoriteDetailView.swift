//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
  
  @State var counter: Int = 0
  
  var body: some View {
    HStack(alignment: .center, spacing: 6) {
      Button(action: {
        if counter > 0 {
          counter -= 1
        }
      }, label: {
        Image(systemName: "minus.circle")
      })
      
      Text("\(counter)")
        .fontWeight(.semibold)
        .frame(minWidth: 36)
      
      Button(action: {
        counter += 1
      }, label: {
        Image(systemName: "plus.circle")
      })
      
      Spacer()
      
      Button(action: {}, label: {
        Image(systemName: "heart.circle")
      })
        .foregroundColor(.pink)
      
    }
    .font(.system(.title, design: .rounded))
    .foregroundColor(.black)
    .imageScale(.large)
  }
}

struct QuantityFavoriteDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavoriteDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
