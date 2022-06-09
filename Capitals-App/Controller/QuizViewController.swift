//
//  ViewController.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/28/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizTypeSelector: UISegmentedControl!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!

    var countryManager = CountryManager()
    var quizTypeIsCapitals: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        countryManager.initData()

        updateUI()
    }

    @objc func updateUI() {
        
        countryManager.loadQuestion()
        
        countryNameLabel.text = countryManager.getQuestionText()

        let optionsList: [String] = countryManager.getOptionsText(quizTypeIsCapitals: quizTypeIsCapitals)

        setButtonAppearance(button: answer1Button, optionString: optionsList[0])
        setButtonAppearance(button: answer2Button, optionString: optionsList[1])
        setButtonAppearance(button: answer3Button, optionString: optionsList[2])
        setButtonAppearance(button: answer4Button, optionString: optionsList[3])
    }

    func setButtonAppearance(button: UIButton, optionString: String) {
        let radius = 15.0

        button.isEnabled = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 15.0

        button.setTitle(optionString, for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 25, weight: .bold)

        button.layer.cornerRadius = radius
        button.imageView?.layer.cornerRadius = radius
        button.backgroundColor = UIColor.white

        if(quizTypeIsCapitals == true) {
            button.setImage(nil, for: .normal)
        } else {
            button.setTitleColor(UIColor.clear, for: .normal)
            button.setImage(UIImage(named: "\(optionString.lowercased()).png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {

        answer1Button.isEnabled = false
        answer2Button.isEnabled = false
        answer3Button.isEnabled = false
        answer4Button.isEnabled = false

        let userGotItRight = countryManager.checkAnswer(quizTypeIsCapitals: quizTypeIsCapitals, userAnswer: sender.currentTitle!)

        sender.layer.shadowOpacity = 1
        sender.layer.shadowRadius = 25.0

        if(userGotItRight) {
            sender.layer.shadowColor = UIColor.green.cgColor
        } else {
            sender.layer.shadowColor = UIColor.red.cgColor
        }

        Timer.scheduledTimer(timeInterval: 0.6, target: self,
            selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @IBAction func quizTypeChanged(_ sender: Any) {
        if(quizTypeSelector.selectedSegmentIndex == 0) {
            quizTypeIsCapitals = true
        } else {
            quizTypeIsCapitals = false
        }

        updateUI()
    }
}

