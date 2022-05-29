//
//  CountryData.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/29/22.
//

import Foundation

struct CountryData: Codable {
    let countries: [SingleCountry]
}


struct SingleCountry: Codable {
    let name: String
    let capital: String
}
