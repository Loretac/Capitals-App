//
//  CountryManager.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/29/22.
//

import Foundation

struct CountryManager {
    
    var countryList : [Country] = []
//

    
    mutating func getData(){

        
        let data = readJSONFromFile(fileName: "data")

        print(data![0].Capital)
           
          
    }
    
//     from https://www.knowband.com/blog/tutorials/read-data-local-json-file-swift/
    func readJSONFromFile(fileName: String) -> [Country]?
    {
        var json: [Country]?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                
                
                
                
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(CountryData.self, from: data)

                    
                    var b: [Country] = []
                    for item in decodedData.countries{
                        let c = Country(Name: item.name, Capital: item.capital)
                        b.append( c)
                    }
                    
                    print(decodedData.countries[0].name)
                    json =  b
        //            let id = decodedData.weather[0].id
        //            let temp = decodedData.main.temp
        //            let name = decodedData.name
        //
        //            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
        //            return weather

                } catch {
                    print(error)
        //            delegate?.didFailWithError(error: error)
                }
                
                
                
                
//                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                // Handle error here
            }
        }
        return json

    }
    


}
