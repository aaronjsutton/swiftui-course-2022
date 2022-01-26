//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct HeaderDetailView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 6) {
        Text("Protective Gear")
        
        Text(sampleProduct.name)
          .font(.largeTitle)
          .fontWeight(.black)
      }
      .foregroundColor(.white)
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(.gray)
    }
}
