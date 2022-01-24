//
//  CopyrightView.swift
//  Africa
//
//  Created by Aaron Sutton on 1/24/22.
//

import SwiftUI

struct CopyrightView: View {
	var body: some View {
		VStack {
			Image("compass")
				.resizable()
				.scaledToFit()
				.frame(width: 128, height: 128)
			 
			Text("""
	 Copyright © Robert Petras
	 All rights reserved
	 """)
				.font(.footnote)
			.multilineTextAlignment(.center)
		}
		.opacity(0.4)
	}
}

struct CopyrightView_Previews: PreviewProvider {
	static var previews: some View {
		CopyrightView()
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
