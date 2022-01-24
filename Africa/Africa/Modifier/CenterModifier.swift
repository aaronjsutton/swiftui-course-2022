//
//  CenterModifier.swift
//  Africa
//
//  Created by Aaron Sutton on 1/24/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
	func body(content: Content) -> some View {
		HStack {
			Spacer()
			content
			Spacer()
		}
	}
}
