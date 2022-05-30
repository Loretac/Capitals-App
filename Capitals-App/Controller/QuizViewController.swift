//
//  ViewController.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/28/22.
//

import UIKit

class QuizViewController: UIViewController {

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

    @objc func updateUI() {
        countryNameLabel.text = countryManager.getQuestionText()

        let optionsList: [String] = countryManager.getOptionsText()

        answer1Button.setTitle(optionsList[0], for: .normal)
        answer2Button.setTitle(optionsList[1], for: .normal)
        answer3Button.setTitle(optionsList[2], for: .normal)
        answer4Button.setTitle(optionsList[3], for: .normal)

        answer1Button.backgroundColor = UIColor.clear
        answer2Button.backgroundColor = UIColor.clear
        answer3Button.backgroundColor = UIColor.clear
        answer4Button.backgroundColor = UIColor.clear
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle

        let userGotItRight = countryManager.checkAnswer(userAnswer: userAnswer!)

        if(userGotItRight) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        Timer.scheduledTimer(timeInterval: 0.4, target: self,
            selector: #selector(updateUI), userInfo: nil, repeats: false)

        countryManager.loadQuestion()
    }

}

