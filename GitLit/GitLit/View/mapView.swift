////
////  mapView.swift
////  FinalProject
////
////  Created by Jai Timsina on 9/17/21.
////
import SwiftUI
import MapKit
import Firebase

struct mapView: View {
    var title: String = "" //Restaurant Name
      var Latitude: Double = 33.908971
      var Longitude: Double = -84.479157
      var restaurantPhone: String = ""
      var restaurantWebsite: String = ""
      var hours: String = ""
      var priceRange: String = ""
      var Adresss: String
      @ObservedObject var fetch = NetWorkManager()
    

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.908971, longitude: -84.479157),
        span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075))
    
  
    var body: some View {
        
        let places = [
            Place(name: title, latitude: Latitude, longitude: Longitude)
        ]
        VStack{
            Text(title).padding(10).font(.title)
            Text("Phone: \(restaurantPhone)").padding(.leading, 1)
            Text("Hours: \(hours)").padding(.leading,1)
            Text("Price Range: \(priceRange)").padding(.leading,1)
            Text("Adress: \(Adresss)").padding(.leading,1)
            Text("Website: \(restaurantWebsite)").padding(.leading,1)
        }
        
        Map(coordinateRegion: $region, annotationItems: places) { place in
            
            MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                Circle()
                    .strokeBorder(Color.red, lineWidth: 10)
                    .frame(width: 44, height: 44)
            }
        }
        
        .padding(0)
    }
}

