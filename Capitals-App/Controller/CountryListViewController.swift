//
//  CountryListViewController.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/30/22.
//

import UIKit

class CountryListViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    var countryManager = CountryManager()

    var listOfCountries: [CountryModel] = []
    var filteredListOfCountries: [CountryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        searchBar.delegate=self

        
        countryManager.initData()
        listOfCountries = countryManager.getCountryList()
        filteredListOfCountries = listOfCountries

        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

        // Do any additional setup after loading the view.
    }

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredListOfCountries = []
        
        if(searchText == ""){
            filteredListOfCountries=listOfCountries
        }
        
        
        for x in listOfCountries{
            if x.name.lowercased().contains(searchText.lowercased()){
                filteredListOfCountries.append(x)
            }
        }
        
        self.tableView.reloadData()
    }

}

extension CountryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredListOfCountries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CountryCell
        cell.countryNameLabel.text = filteredListOfCountries[indexPath.row].name
        cell.capitalLabel.text =   filteredListOfCountries[indexPath.row].capital
        cell.flagImage.image = UIImage(named: "\(filteredListOfCountries[indexPath.row].iso_code.lowercased()).png")
        
//        cell.flagImage.layer.shadowColor = UIColor.black.cgColor
//        cell.flagImage.layer.shadowOpacity = 0.2
//        cell.flagImage.layer.shadowOffset = CGSize(width: 0, height: 0)
//        cell.flagImage.layer.shadowRadius = 15.0
        
        
        return cell
    }


}
