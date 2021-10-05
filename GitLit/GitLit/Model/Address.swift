//
//  Address.swift

//
//  Created by Field Employee on 16/09/2021.
//
import Foundation
import Firebase

struct Address: Decodable {
    
    var city: String = ""
    var state: String = ""
    var postalCode: String = ""
    var street: String = ""
    var formatted: String = ""
    
    enum CodingKeys: String, CodingKey
    {
        case postalCode = "postal_code"
        case city, state, street, formatted
    }
}
