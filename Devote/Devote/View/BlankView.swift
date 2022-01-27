//
//  BlankView.swift
//  Devote
//
//  Created by Aaron Sutton on 1/27/22.
//

import SwiftUI

struct BlankView: View {
	
	var backgroundColor: 
	var body: some View {
		VStack {
			Spacer()
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
		.background(Color.black)
		.opacity(0.5)
		.edgesIgnoringSafeArea(.all)
	}
}

struct BlankView_Previews: PreviewProvider {
	static var previews: some View {
		BlankView()
			.background(backgroundGradient.edgesIgnoringSafeArea(.all))
	}
}
