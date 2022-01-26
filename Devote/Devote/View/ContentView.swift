//
//  ContentView.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
	
	@State var task: String = ""
	@State var showNewTaskItem: Bool = false

	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
		animation: .default)
	
	private var items: FetchedResults<Item>
	
	
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { items[$0] }.forEach(viewContext.delete)
			
			do {
				try viewContext.save()
			} catch {
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
	
	var body: some View {
		NavigationView {
			ZStack {
				VStack {
					List {
						ForEach(items) { item in
							VStack(alignment: .leading) {
								Text(item.task ?? "")
									.font(.headline)
									.fontWeight(.bold)
								
								Text("Item at \(item.timestamp!, formatter: itemFormatter)")
									.font(.footnote)
									.foregroundColor(.gray)
							}
						}
						.onDelete(perform: deleteItems)
					}
					.listStyle(InsetGroupedListStyle())
					.shadow(color: Color(white: 0, opacity: 0.3), radius: 12)
					.padding(.vertical, 0)
					.frame(maxWidth: 640)
				}
				.onAppear() {
					UITableView.appearance().backgroundColor = UIColor.clear
				}
				.navigationTitle("Daily Tasks")
				.navigationBarTitleDisplayMode(.large)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						EditButton()
					}
				}
				.background(BackgroundImageView())
				.background(backgroundGradient.ignoresSafeArea())
			}
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
