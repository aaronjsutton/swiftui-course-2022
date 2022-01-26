//
//  Persistence.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import CoreData

struct PersistenceController {
	
	// MARK: - PERSITENCE CONTROLLER
	
	static let shared = PersistenceController()
	
	let container: NSPersistentContainer
	
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "Devote")
		
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		container.viewContext.automaticallyMergesChangesFromParent = true
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
	}
	
	static var preview: PersistenceController = {
		let result = PersistenceController(inMemory: true)
		let viewContext = result.container.viewContext
		
		for i in 0..<5 {
			let newItem = Item(context: viewContext)
			newItem.timestamp = Date()
			newItem.task = "Sample Task \(i)"
			newItem.completion = false
			newItem.id = UUID()
		}
		do {
			try viewContext.save()
		} catch {
			// Replace this implementation with code to handle the error appropriately.
			// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		return result
	}()
}
