//
//  Location.swift
//  Africa
//
//  Created by Aaron Sutton on 1/23/22.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
	var id: String
	var name: String
	var image: String
	var latitude: Double
	var longitude: Double
	
	var location: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
