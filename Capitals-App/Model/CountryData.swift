//
//  CountryData.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/29/22.
//

import Foundation

// These structs are used for JSON parsing
struct CountryData: Codable {
    let countries: [Country]
}

struct Country: Codable {
    let name: String
    let capital: String
    let iso_code: String
}
