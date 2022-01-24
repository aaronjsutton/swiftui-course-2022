//
//  GalleryView.swift
//  Africa
//
//  Created by Aaron Sutton on 1/21/22.
//

import SwiftUI

struct GalleryView: View {
	var body: some View {
		ScrollView {
			Text("Gallery")
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(MotionAnimationView() )
	}
}

struct GalleryView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryView()
	}
}
