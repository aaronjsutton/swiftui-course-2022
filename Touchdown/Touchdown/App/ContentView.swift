//
//  ContentView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var shop: Shop
  
  var body: some View {
    ZStack {
      if !shop.showingProduct && shop.selectedProduct == nil {
        VStack(spacing: 0) {
          NavigationBarView()
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, getSafeAreaTop())
            .background(.white)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
          
          ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
              FeaturedTabView()
                .padding(.vertical)
                .frame(height: UIScreen.main.bounds.width / 1.475)
              
              CategoryGridView()
              
              TitleView(title: "Helmets")
              
              LazyVGrid(columns: gridLayout, spacing: 15) {
                ForEach(products) { product in
                  ProductItemView(product: product)
                    .onTapGesture {
                      feedback.impactOccurred()
                      withAnimation(.easeOut) {
                        shop.showingProduct = true
                        shop.selectedProduct = product
                      }
                    }
                }
              }
              .padding(15)
              
              TitleView(title: "Brands")
              
              BrandGridView()
              
              FooterView()
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity)
          }
        }
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
      } else {
        ProductDetailView()
      }
    }
    .ignoresSafeArea(.all, edges: .top)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Shop())
      .previewDevice("iPhone 8")
  }
}
