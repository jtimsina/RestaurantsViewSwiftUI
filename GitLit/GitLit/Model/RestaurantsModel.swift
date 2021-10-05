//
//  FinalProject
//
//  Created by Jai Timsina on 9/17/21.
//

import SwiftUI
import Firebase

struct ResponseRestaurant: Decodable {
    let data: [RestaurantsModel]
    var totalResults: Int
    var page: Int
    var total_pages: Int
    
}

struct RestaurantsModel: Decodable, Identifiable {
    let id: Int
    var restaurantName: String = ""
    var restaurantPhone: String = ""
    var restaurantWebsite: String = ""
    var hours: String = ""
    var priceRange: String = ""
    var priceRangeNum: Int = 0
    var cuisines: [String] = []
    var address: Address
    var geo: Geo

    enum CodingKeys: String, CodingKey {
        case id = "restaurant_id"
        case restaurantName = "restaurant_name"
        case restaurantPhone = "restaurant_phone"
        case restaurantWebsite = "restaurant_website"
        case hours
        case priceRange = "price_range"
        case priceRangeNum = "price_range_num"
        case cuisines, address, geo
    }
}

