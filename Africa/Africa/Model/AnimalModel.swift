//
//  AnimalModel.swift
//  Africa
//
//  Created by Aaron Sutton on 1/23/22.
//

import Foundation

struct Animal: Codable, Identifiable {
	let id: String
	let name: String
	let headline: String
	let description: String
	let link: String
	let image: String
	let fact: [String]
	let gallery: [String]
}
