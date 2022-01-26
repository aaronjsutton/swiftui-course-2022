//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
#endif

