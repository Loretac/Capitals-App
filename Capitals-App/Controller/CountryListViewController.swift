//
//  CountryListViewController.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/30/22.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countryManager = CountryManager()

    var listOfCountries: [CountryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        countryManager.initData()
        listOfCountries = countryManager.getCountryList()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CountryListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = listOfCountries[indexPath.row].name
        return cell
    }
    
    
}
