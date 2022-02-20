//
//  ViewController.swift
//  Quiz
//
//  Created by hua li on 2022/2/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "From what is cognac made?",
        "What is the capital of Vermont?"
    ]
    let answers: [String] = [
        "14",
        "Grapess",
        "Montpelier"
    ]
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if (currentQuestionIndex == questions.count) {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }

}

