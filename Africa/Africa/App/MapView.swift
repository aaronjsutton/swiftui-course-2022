//
//  MapView.swift
//  Africa
//
//  Created by Aaron Sutton on 1/21/22.
//

import SwiftUI
import MapKit

struct MapView: View {
	
	@State var region: MKCoordinateRegion = {
		var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377589)
		var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
		return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
	}()
	
	let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
	
	var body: some View {
		Map(coordinateRegion: $region, annotationItems: locations) {
			item in
			MapAnnotation(coordinate: item.location) {
				MapAnnotationView(location: item)
			}
		}
		.overlay(
			HStack(alignment: .center, spacing: 12) {
				Image("compass")
					.resizable()
					.scaledToFit()
					.frame(width: 40, height: 40, alignment: .center)
				
				VStack(alignment: .leading, spacing: 3) {
					HStack {
						Text("Latitude: ")
							.font(.footnote)
							.fontWeight(.bold)
							.foregroundColor(.accentColor)
						Spacer()
						Text("\(region.center.latitude)")
							.font(.footnote)
							.foregroundColor(.white)
					}
					
					Divider()
					
					HStack {
						Text("Longitude: ")
							.font(.footnote)
							.fontWeight(.bold)
							.foregroundColor(.accentColor)
						Spacer()
						Text("\(region.center.longitude)")
							.font(.footnote)
							.foregroundColor(.white)
					}
				}
			}
				.padding(.vertical, 12)
				.padding(.horizontal, 16)
				.background(
					Color.black
						.cornerRadius(8)
						.opacity(0.6)
				)
				.padding()
			, alignment: .top
		)
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
	}
}
