//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
			Image("rocket")
				.antialiased(true)
				.resizable()
				.scaledToFill()
				.ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
