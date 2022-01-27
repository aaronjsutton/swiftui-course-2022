//
//  ContentView.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
	
	@AppStorage("isDarkMode") private var isDarkMode: Bool = false
	
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
					
					HStack(spacing: 10) {
						Text("Devote")
							.font(.system(.largeTitle, design: .rounded))
							.fontWeight(.heavy)
							.padding(.leading, 4)
						
						Spacer()
						
						EditButton()
							.font(.system(size: 16, weight: .semibold, design: .rounded))
							.padding(.horizontal, 10)
							.frame(minWidth: 70, minHeight: 24)
							.background(
								Capsule().stroke(.white, lineWidth: 2)
							)
						
						Button(action: {
							isDarkMode.toggle()
						}, label: {
							Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
								.resizable()
								.frame(width: 24, height: 24)
								.font(.system(.title, design: .rounded))
						})
					}
					.padding()
					.foregroundColor(.white)
					
					Spacer(minLength: 80)
					
					Button(action: {
						showNewTaskItem = true
					}, label: {
						Image(systemName: "plus.circle")
							.font(.system(size: 30, weight: .semibold, design: .rounded))
						Text("New Task")
							.font(.system(size: 24, weight: .bold, design: .rounded))
					})
						.foregroundColor(.white)
						.padding(.horizontal, 20)
						.padding(.vertical, 15)
						.background(
							LinearGradient(
								gradient: Gradient(colors: [Color.pink, Color.blue]),
								startPoint: .leading,
								endPoint: .trailing
							).clipShape(Capsule())
						)
						.shadow(color: Color(white: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
					
					List {
						ForEach(items) { item in
							ListRowItemView(item: item)
						}
						.onDelete(perform: deleteItems)
					}
				}
				
				.listStyle(InsetGroupedListStyle())
				.shadow(color: Color(white: 0, opacity: 0.3), radius: 12)
				.padding(.vertical, 0)
				.frame(maxWidth: 640)
				
				if showNewTaskItem {
					BlankView()
						.onTapGesture {
							withAnimation() {
								showNewTaskItem = false
							}
						}
					
					NewTaskItemView(isShowing: $showNewTaskItem)
				}
			}
			.onAppear() {
				UITableView.appearance().backgroundColor = UIColor.clear
			}
			.navigationTitle("Daily Tasks")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarHidden(true)
			// .background(BackgroundImageView())
			.background(backgroundGradient.ignoresSafeArea())
		}
		.navigationViewStyle(StackNavigationViewStyle())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().preferredColorScheme(.light).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
