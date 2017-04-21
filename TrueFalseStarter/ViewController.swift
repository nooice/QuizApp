//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    //variables
    var questionProvider = QuestionProvider()
    var questionsAsked = 0
    var correctQuestions = 0
    var currentQuestion: [String:String] = [:]
    var gameSound: SystemSoundID = 0
    
   //sets up buttons
    @IBOutlet weak var notificationField: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //main function used to set up each question
    func displayQuestion() {
        notificationField.isHidden = true
        playAgainButton.isHidden = true
        showButtons()
        currentQuestion = questionProvider.getQuestion(number: questionsAsked)
        questionField.text = currentQuestion["Question"]
        switch currentQuestion["AmountOfOptions"]! {
        case "2":
            option1.setTitle(currentQuestion["Option1"], for: UIControlState.normal)
            option2.setTitle(currentQuestion["Option2"], for: UIControlState.normal)
            option3.isHidden = true
            option4.isHidden = true
        case "3":
            option1.setTitle(currentQuestion["Option1"], for: UIControlState.normal)
            option2.setTitle(currentQuestion["Option2"], for: UIControlState.normal)
            option3.setTitle(currentQuestion["Option3"], for: UIControlState.normal)
            option4.isHidden = true
        case "4":
            option1.setTitle(currentQuestion["Option1"], for: UIControlState.normal)
            option2.setTitle(currentQuestion["Option2"], for: UIControlState.normal)
            option3.setTitle(currentQuestion["Option3"], for: UIControlState.normal)
            option4.setTitle(currentQuestion["Option4"], for: UIControlState.normal)
        default:
            break
        }
    }
    
    //when all questions have been asked, buttons are hidden and score is shown
    func gameOver() {
        hideButtons()
        questionField.text = "Game Over"
        notificationField.text = "You got \(correctQuestions) out of \(questionProvider.shuffledQuestion.count) correct"
        notificationField.isHidden = false
        playAgainButton.setTitle("New Game", for: UIControlState.normal)
        questionsAsked += 1
    }
    
    //resets the counter and reshuffles the questions
    func resetGame() {
        questionsAsked = 0
        correctQuestions = 0
        questionProvider.shuffleTime()
        displayQuestion()
    }
    
    //functions for quick access to manipulating all possible answer buttons
    func showButtons() {
        option1.isHidden = false
        option2.isHidden = false
        option3.isHidden = false
        option4.isHidden = false
    }
    func hideButtons() {
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
    }
    func enableButtons() {
        option1.isEnabled = true
        option2.isEnabled = true
        option3.isEnabled = true
        option4.isEnabled = true
    }
    func disableButtons() {
        option1.isEnabled = false
        option2.isEnabled = false
        option3.isEnabled = false
        option4.isEnabled = false
    }
    
    //function for checking if selected button is the correct answer
    @IBAction func checkAnswer(_ sender: UIButton) {
        disableButtons()
        //checks if the string value of the button title is equal to the string value of the answer key of current question
        if (sender.currentTitle == currentQuestion["Answer"]){
            correctQuestions += 1
            playAgainButton.setTitle("Next Question", for: UIControlState.normal)
            playAgainButton.isHidden = false
            notificationField.text = "Correct!"
            notificationField.isHidden = false
        } else{
            playAgainButton.setTitle("Next Question", for: UIControlState.normal)
            playAgainButton.isHidden = false
            notificationField.text = "Oops... Wrong Answer"
            notificationField.isHidden = false
        }
        questionsAsked += 1
        //if its the last question the next question button will change to finish indicating a finished game
        if (questionsAsked == questionProvider.shuffledQuestion.count){
            playAgainButton.setTitle("Finish", for: UIControlState.normal)
        }
    }
    
    //action for next question button
    
    //if its not the last question, show the next question...
    //else if it is, do gameover function...
    //when game over function is called it puts the questionAsked
    //variable higher than the amount of quesitons...
    //then if you click the next question button and the count is higher,
    //it will reset the game. this is also helpful so that if there is some
    //error with the counter it won't crash the game. if the variable
    //is higher than the length of the array holding the
    //questions, it will just reset.
    @IBAction func nextRound(_ sender: UIButton){
        enableButtons()
        if (questionsAsked < questionProvider.shuffledQuestion.count){
            displayQuestion()
        }else if (questionsAsked == questionProvider.shuffledQuestion.count){
            gameOver()
        }else if (questionsAsked > questionProvider.shuffledQuestion.count){
            resetGame()
        }
    }
    //game sounds
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

