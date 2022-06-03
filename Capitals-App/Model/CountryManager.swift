//
//  CountryManager.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/29/22.
//

import Foundation

struct CountryManager {

    var countryList: [CountryModel] = []
    var currentQuestion: CountryModel?
    var selectionOptions: [CountryModel] = []

    mutating func initData() {

// country and capital data from https://geographyfieldwork.com/WorldCapitalCities.htm
        let data = readJSONFromFile(fileName: "data")

        if let safeData = data {
            let sortedSafeData = safeData.sorted(by: { $0.name < $1.name })
            countryList = sortedSafeData
        }
    }
    
    func getCountryList() -> [CountryModel]{
        return countryList
    }

    mutating func loadQuestion() {
        // For now, just load a random question. In future, we may increment it

        // Make a copy of the list of countries
        var copyOfCountryList = countryList.shuffled()

        currentQuestion = copyOfCountryList.removeLast()
        selectionOptions = []

        for _ in 0...2 {
            selectionOptions.append(copyOfCountryList.removeLast())
        }
    }

    func getQuestionText() -> String {
        return currentQuestion!.name
    }

    func getOptionsText(quizTypeIsCapitals: Bool) -> [String] {

        var optionsList: [String] = []
        
        if(quizTypeIsCapitals == true) {
            for country in selectionOptions {
                optionsList.append(country.capital)
            }
            optionsList.append(currentQuestion!.capital)
            
        } else {
            for country in selectionOptions {
                optionsList.append(country.iso_code)
            }
            optionsList.append(currentQuestion!.iso_code)
        }

        return optionsList.shuffled()
    }

    func checkAnswer(quizTypeIsCapitals: Bool, userAnswer: String) -> Bool {
        
        if(quizTypeIsCapitals == true && userAnswer == currentQuestion?.capital
        || quizTypeIsCapitals == false && userAnswer == currentQuestion?.iso_code){
            return true
        }else{
            return false
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
                        b.append(CountryModel(name: item.name, capital: item.capital, iso_code: item.iso_code))
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
