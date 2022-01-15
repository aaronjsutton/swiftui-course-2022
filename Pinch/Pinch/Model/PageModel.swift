//
//  PageModel.swift
//  Pinch
//
//  Created by Aaron Sutton on 1/15/22.
//

import Foundation

struct Page: Identifiable {
	let id: Int
	let imageName: String
}

extension Page {
	var thumbnailName: String {
			return "thumb-" + imageName
	}
}
