//
//  RestaurantView.swift
//  GitLit
//
//  Created by Jai TImsina on 9/21/21.
//
//

import SwiftUI
import Foundation
import Combine
import MapKit
import Firebase

struct RestaurantsView: View {
    @ObservedObject var fetch = NetWorkManager()
    @State private var showDetailsView = false
    

    @State private var searchText = ""
    var body: some View {
        NavigationView{
        VStack {
            
            SearchBar(text: $searchText)
            Divider()
            List(fetch.ArrayStorage.filter({ searchText.isEmpty ? true : $0.restaurantName.contains(searchText) })) { RestaurantName in
                VStack(alignment: .leading) {
                    
                   let title0 = RestaurantName.restaurantName
                   let Latitude0 = RestaurantName.geo.lat
                   let Longitude0 = RestaurantName.geo.lon
                   let phone = RestaurantName.restaurantPhone
                   let website = RestaurantName.restaurantWebsite
                   let hours = RestaurantName.hours
                   let pricerange = RestaurantName.priceRange
                   let formatedAdress = RestaurantName.address.formatted



                    NavigationLink(destination: mapView(title: title0, Latitude: Latitude0, Longitude: Longitude0,restaurantPhone: phone, restaurantWebsite: website, hours: hours,priceRange: pricerange, Adresss: formatedAdress).frame(width: 350, height: 350, alignment: .top)) {
                                        Text(title0)
                        }
                }
                
            }
        }
        .navigationBarTitle("Restaurants")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct Restaurants_View: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
