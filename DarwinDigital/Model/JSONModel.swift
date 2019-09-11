//
//  JSONModel.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import Foundation

//struct ResponseData: Decodable {
//    let person: [JSONData]
//}

//struct JSONData: Decodable {
//    let id: Int
//    let name: String
//    let username: String
//    let email: String
//    let adress: Adress
//    let avatar: String
//    let phone: String
//    let website: String
//    let company: Company
//}
//
//struct Adress: Decodable {
//    let street: String
//    let suite: String
//    let city: String
//    let zipcode: String
//    let geo: Geo
//}
//
//struct Geo: Decodable {
//    let lat: String
//    let lng: String
//}
//
//struct Company: Decodable {
//    let name: String
//    let catchPhrase: String
//    let bs: String
//}



struct JSONData: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let avatar: String
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

