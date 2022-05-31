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
        
        if(quizTypeIsCapitals == true){
            
            
            
            answer1Button.setBackgroundImage(nil, for: .normal)
            answer2Button.setBackgroundImage(nil, for: .normal)
            answer3Button.setBackgroundImage(nil, for: .normal)
            answer4Button.setBackgroundImage(nil, for: .normal)

            answer1Button.setTitle(optionsList[0], for: .normal)
            answer2Button.setTitle(optionsList[1], for: .normal)
            answer3Button.setTitle(optionsList[2], for: .normal)
            answer4Button.setTitle(optionsList[3], for: .normal)

            answer1Button.tintColor = UIColor.systemBlue
            answer2Button.tintColor = UIColor.systemBlue
            answer3Button.tintColor = UIColor.systemBlue
            answer4Button.tintColor = UIColor.systemBlue
        }else{
            
            answer1Button.setTitle("", for: .normal)
            answer2Button.setTitle("", for: .normal)
            answer3Button.setTitle("", for: .normal)
            answer4Button.setTitle("", for: .normal)
            

            answer1Button.setBackgroundImage(UIImage(named: "\(optionsList[0].lowercased()).pdf"), for: .normal)
            answer2Button.setBackgroundImage(UIImage(named: "\(optionsList[1].lowercased()).pdf"), for: .normal)
            answer3Button.setBackgroundImage(UIImage(named: "\(optionsList[2].lowercased()).pdf"), for: .normal)
            answer4Button.setBackgroundImage(UIImage(named: "\(optionsList[3].lowercased()).pdf"), for: .normal)


//
//            answer1Button.imageView?.contentMode = .scaleAspectFit
//            answer1Button.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
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

