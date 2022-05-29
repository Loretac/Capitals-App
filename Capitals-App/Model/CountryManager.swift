//
//  CountryManager.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/29/22.
//

import Foundation

struct CountryManager {

    var countryList: [CountryModel] = []

    mutating func getData() {

// country and capital data from https://geographyfieldwork.com/WorldCapitalCities.htm
        let data = readJSONFromFile(fileName: "data")

        if let safeData = data {
            countryList = safeData
        }
        
        
        for item in countryList{
            print("\(item.name), \(item.capital)")
        }


    }

//     from https://www.knowband.com/blog/tutorials/read-data-local-json-file-swift/
    func readJSONFromFile(fileName: String) -> [CountryModel]?
    {
        var json: [CountryModel]?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)

                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(CountryData.self, from: data)

                    var b: [CountryModel] = []
                    for item in decodedData.countries {
                        b.append(CountryModel(name: item.name, capital: item.capital))
                    }

                    json = b

                } catch {
                    print(error)
                }
            } catch {
                print(error)
            }
        }
        return json

    }



}
