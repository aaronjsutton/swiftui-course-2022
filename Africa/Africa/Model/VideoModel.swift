//
//  VideoDataModel.swift
//  Africa
//
//  Created by Aaron Sutton on 1/21/22.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
	
	var thumbnail: String {
		"video-\(id)"
	}
}
