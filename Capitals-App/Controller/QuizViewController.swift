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

    @IBOutlet weak var quizTypeSelector: UISegmentedControl!

    var countryManager = CountryManager()
    var quizTypeIsCapitals: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        countryManager.initData()

        countryManager.loadQuestion()

        updateUI()
    }

    @objc func updateUI() {
        countryNameLabel.text = countryManager.getQuestionText()

        let optionsList: [String] = countryManager.getOptionsText(quizTypeIsCapitals: quizTypeIsCapitals)

        setButtonAppearance(button: answer1Button, optionString: optionsList[0])
        setButtonAppearance(button: answer2Button, optionString: optionsList[1])
        setButtonAppearance(button: answer3Button, optionString: optionsList[2])
        setButtonAppearance(button: answer4Button, optionString: optionsList[3])
    }

    func setButtonAppearance(button: UIButton, optionString: String) {
        let radius = 15.0

        if(quizTypeIsCapitals == true) {
            let buttonColor = UIColor.white

            button.setImage(nil, for: .normal)
            button.setTitle(optionString, for: .normal)
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel!.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            button.backgroundColor = buttonColor
            button.layer.cornerRadius = radius

            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.2
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
            button.layer.shadowRadius = 15.0
        } else {
            button.setTitle("", for: .normal)
            button.setImage(UIImage(named: "\(optionString.lowercased()).svg")?.withRenderingMode(.alwaysOriginal), for: .normal)
            button.imageView?.layer.cornerRadius = radius

        }
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle

        let userGotItRight = countryManager.checkAnswer(userAnswer: userAnswer!)

        if(userGotItRight) {
            sender.tintColor = UIColor.green
        } else {
            sender.tintColor = UIColor.red
        }

        Timer.scheduledTimer(timeInterval: 0.4, target: self,
            selector: #selector(updateUI), userInfo: nil, repeats: false)

        countryManager.loadQuestion()
    }

    @IBAction func quizTypeChanged(_ sender: Any) {
        if(quizTypeSelector.selectedSegmentIndex == 0) {
            quizTypeIsCapitals = true
        } else {
            quizTypeIsCapitals = false
        }

        countryManager.loadQuestion()

        updateUI()
    }
}

