//
//  QuestionProvider.swift
//  TrueFalseStarter
//
//  Created by Kalvin Bunn on 4/18/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//
import UIKit
import GameKit

//questions set outside the struct because it wont let me shuffle them if they are inside the struct
let question: [[String : String]] = [
    ["Question": "Which Platform is Better?", "Answer": "iOS", "Option1": "iOS", "Option2": "Android", "AmountOfOptions": "2"],
    ["Question": "How Many Eyes do 'daddy-longlegs' have?", "Answer": "Two", "Option1": "Two", "Option2": "Four", "Option3": "Six", "Option4": "Eight", "AmountOfOptions": "4"],
    ["Question": "A housefly hums in the key of... What?", "Answer": "F", "Option1": "D", "Option2": "C", "Option3": "F", "AmountOfOptions": "3"],
    ["Question": "Where do French poodles originate?", "Answer": "Germany", "Option1": "France", "Option2": "Germany", "AmountOfOptions": "2"]
]

//struct for calling questions
struct QuestionProvider {
    //sets the questions shuffled
    var shuffledQuestion = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: question)
    
    //game call this when it reloads a new game to shuffle questions again
    mutating func shuffleTime(){
        shuffledQuestion = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: question)
    }
    
    //function used to call next item in shuffledQuestion array
    func getQuestion(number: Int) -> [String:String]{
        return shuffledQuestion[number] as! [String : String]
    }
}
