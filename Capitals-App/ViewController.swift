//
//  ViewController.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!

    @IBOutlet weak var settingsButton: UIButton!


    var countryManager = CountryManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        countryManager.getData()

        countryManager.loadQuestion()

        updateUI()
    }

    func updateUI() {
        countryNameLabel.text = countryManager.getQuestionText()

        let optionsList: [String] = countryManager.getOptionsText()

        answer1Button.titleLabel?.text = optionsList[0]
        answer2Button.titleLabel?.text = optionsList[1]
        answer3Button.titleLabel?.text = optionsList[2]
        answer4Button.titleLabel?.text = optionsList[3]

    }


}

