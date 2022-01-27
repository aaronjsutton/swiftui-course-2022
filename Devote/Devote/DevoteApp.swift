//
//  DevoteApp.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI

@main
struct DevoteApp: App {
	let persistenceController = PersistenceController.shared
	
	@AppStorage("isDarkMode") var isDarkMode: Bool = false
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
				.preferredColorScheme(isDarkMode ? .dark : .light)
		}
	}
}
