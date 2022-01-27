//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Aaron Sutton on 1/26/22.
//

import SwiftUI

struct NewTaskItemView: View {
	
	@AppStorage("isDarkMode") private var isDarkMode: Bool = false
	@Environment(\.managedObjectContext) private var viewContext
	@State var task: String = ""
	@Binding var isShowing: Bool
	
	private var isButtonDisabled: Bool {
		task.isEmpty
	}
	
	private func addItem() {
		withAnimation {
			let newItem = Item(context: viewContext)
			newItem.timestamp = Date()
			newItem.task = task
			newItem.completion = false
			newItem.id = UUID()
			
			do {
				try viewContext.save()
			} catch {
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
			
			task = ""
			hideKeyboard()
			isShowing = false
		}
	}
	
	var body: some View {
		VStack {
			Spacer()
			
			VStack(spacing: 16) {
				TextField("New Task", text: $task)
					.foregroundColor(.pink)
					.font(.system(size: 24, weight: .bold, design: .rounded))
					.padding()
					.background(
						Color(uiColor: UIColor.systemGray6)
					)
					.cornerRadius(10)
				
				Button(action: {
					addItem()
				}, label: {
					Spacer()
					Text("Save".uppercased())
						.font(.system(size: 24, weight: .bold, design: .rounded))
					Spacer()
				})
					.disabled(isButtonDisabled)
					.padding()
					.foregroundColor(.white)
					.background(isButtonDisabled ? Color.blue :  Color.pink)
					.cornerRadius(10)
			}
			.padding(.horizontal, 10)
			.padding(.vertical, 20)
			.background(isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white)
			.cornerRadius(16)
			.shadow(color: Color(white: 0, opacity: 0.65), radius: 24)
		}
		.padding()
	}
}

struct NewTaskItemView_Previews: PreviewProvider {
	static var previews: some View {
		NewTaskItemView(isShowing: .constant(true))
			.previewDevice("iPhone 12 Pro")
			.preferredColorScheme(.dark)
			.background(Color.gray.edgesIgnoringSafeArea(.all))
	}
}
