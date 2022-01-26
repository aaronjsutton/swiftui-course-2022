//
//  RatingsSizesDetailView.swift
//  Touchdown
//
//  Created by Aaron Sutton on 1/25/22.
//

import SwiftUI

struct RatingsSizesDetailView: View {
	var body: some View {
		HStack(alignment: .leading, spacing: 3) {
			Text("Ratings")
				.font(.footnote)
				.fontWeight(.semibold)
				.foregroundColor(.gray)
		}
	}
}

struct RatingsSizesDetailView_Previews: PreviewProvider {
	static var previews: some View {
		RatingsSizesDetailView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
