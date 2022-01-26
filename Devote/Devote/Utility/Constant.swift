//
//  Constants.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import Foundation
import SwiftUI

let itemFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateStyle = .short
	formatter.timeStyle = .medium
	return formatter
}()


var backgroundGradient: LinearGradient {
	return LinearGradient(
		gradient: Gradient(colors: [Color.pink, Color.blue]),
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)
}
