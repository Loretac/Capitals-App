//
//  ViewController.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    var countryManager = CountryManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countryManager.getData()

    }


}

