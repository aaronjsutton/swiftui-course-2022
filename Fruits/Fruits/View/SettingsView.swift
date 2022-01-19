//
//  SettingsView.swift
//  Fruits
//
//  Created by Aaron Sutton on 1/19/22.
//

import SwiftUI

struct SettingsView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false){
        VStack(spacing: 20) {
          
          GroupBox(
            label:
              SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
          ) {
            
            Divider().padding(.vertical, 4)
            
            HStack(alignment: .center, spacing: 10) {
              Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              
              Text("Most frutis are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                .font(.footnote)
            }
          }
          
          GroupBox(
            label: SettingsLabelView(labelText: "Application", labelImage: "app.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "Aaron Sutton")
            SettingsRowView(name: "Designer", content: "Robert Petras")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            
            SettingsRowView(name: "Website", linkLabel: "Homepage", linkDestination: "aaron.as")
            SettingsRowView(name: "Twitter", linkLabel: "@aaronjsutton", linkDestination: "twitter.com/aaronjsutton")
            
            SettingsRowView(name: "SwiftUI", content: "2.0")
            SettingsRowView(name: "Version", content: "1.1.0")
          }
        }
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(
          trailing:
            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
            })
        .padding()
      }
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .previewDevice("iPhone 11 Pro")
      .preferredColorScheme(.dark)
  }
}
