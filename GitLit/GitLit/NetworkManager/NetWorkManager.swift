//
//  Created by jai Timsina on 9/21/21.
//
import SwiftUI
import Foundation
import Combine
import Firebase

class NetWorkManager: ObservableObject {
    @Published var ArrayStorage = [RestaurantsModel]()
     
    init() {
        let url = URL(string: "https://api.documenu.com/v2/restaurants/search/fields?key=f49311c2cef717fe549cf449caa4e27b")!
       
        
        print("")
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode(ResponseRestaurant.self, from: todoData)
                    DispatchQueue.main.async {
                        self.ArrayStorage = decodedData.data
                    }
                } else {
                    print("No data")
                }
            } catch (let error) {
                let error = error
                print(error.localizedDescription)
                print("Error With the json")
            }
        }.resume()
    }
}
