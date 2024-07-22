//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var firstChoice: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        /* same as above line
        let actualQuestion = quiz[questionNumber]
        let actualAnswer = actualQuestion.answer
         */
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAnswers()
        firstChoice.setTitle(answerChoices[0], for: .normal)
        /* same as above
         firstChoice.setTitle(quizBrain.getFirstAnswerText(), for: .normal)
         */
        secondChoice.setTitle(answerChoices[1], for: .normal)
        thirdChoice.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear
    }
}

