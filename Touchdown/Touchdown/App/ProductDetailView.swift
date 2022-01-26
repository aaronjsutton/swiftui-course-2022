//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct ProductDetailView: View {
  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .leading, spacing: 5) {
        
        NavigationBarDetailView()
          .padding(.horizontal)
          .padding(.bottom)
          .padding(.top, geometry.safeAreaInsets.top)
        
        HeaderDetailView()
          .padding(.horizontal)
        
        TopPartDetailView()
          .padding(.horizontal)
					.zIndex(1)
				
				VStack(alignment: .center, spacing: 0) {
					ScrollView(.vertical, showsIndicators: false) {
						Text(sampleProduct.description)
							.font(.system(.body, design: .rounded))
							.foregroundColor(.gray)
							.multilineTextAlignment(.leading)
					}
					Spacer()
				}
				.padding(.horizontal)
				.background(
					Color.white
						.clipShape(CustomShape())
						.padding(.top, -105)
				)
				
        
        Spacer()
      }
      .ignoresSafeArea(.all, edges: .all)
      .background(
        Color(
          red: sampleProduct.red,
          green: sampleProduct.green,
          blue: sampleProduct.blue
        ).ignoresSafeArea(.all, edges: .all)
      )
    }
  }
}

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .previewDevice("iPhone 13 Pro")
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
