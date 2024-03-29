//
//  SettingsLabelView.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/19/22.
//

import SwiftUI

struct SettingsLabelView: View {
  
  var labelText: String
  var labelImage: String
  
  var body: some View {
    HStack {
      Text(labelText.uppercased())
      Spacer()
      Image(systemName: labelImage)
    }
  }
}

struct SettingsLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
