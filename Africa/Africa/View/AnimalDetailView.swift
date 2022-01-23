//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Aaron Sutton on 1/23/22.
//

import SwiftUI

struct AnimalDetailView: View {
	
	let animal: Animal
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 20) {
				Image(animal.image)
					.resizable()
					.scaledToFit()
				
				Text(animal.name.uppercased())
					.font(.largeTitle)
					.fontWeight(.heavy)
					.multilineTextAlignment(.center)
					.padding(.vertical, 8)
					.foregroundColor(.primary)
					.background(
						Color.accentColor
							.frame(height: 9)
							.offset(y: 24)
					)
				
				Text(animal.headline)
					.font(.headline)
					.multilineTextAlignment(.leading)
					.foregroundColor(.accentColor)
					.padding(.horizontal)
				
				Group {
					HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
					
					InsetGalleryView(animal: animal)
				}
			}
			.navigationBarTitle(Text("Learn about \(animal.name)"))
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct AnimalDetailView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
	
	static var previews: some View {
		NavigationView {
			AnimalDetailView(animal: animals[0])
		}
		.previewDevice("iPhone 11 Pro")
	}
}
