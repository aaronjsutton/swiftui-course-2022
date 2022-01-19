//
//  FruitModel.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/19/22.
//

import SwiftUI

struct Fruit: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
  var description: String
  var nutrition: [String]
}
