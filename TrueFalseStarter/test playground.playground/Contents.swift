//: Playground - noun: a place where people can play

import UIKit
import GameKit

var str = "Hello, playground"



let quizQs: [[String:String]] = [
        ["Question": "Which Platform is Better?", "Answer": "iOS", "Option1": "iOS", "Option2": "Android", "AmountOfOptions": "2"],
        ["Question": "How Many Eyes do 'daddy-longlegs' have?", "Answer": "Two", "Option1": "Two", "Option2": "Four", "Option3": "Six", "Option4": "Eight", "AmountOfOptions": "4"],
        ["Question": "A housefly hums in the key of... What?", "Answer": "F", "Option1": "D", "Option2": "C", "Option3": "B Flat", "Option4": "F", "AmountOfOptions": "4"],
        ["Question": "Where do French poodles originate?", "Answer": "Germany", "Option1": "France", "Option2": "Germany", "AmountOfOptions": "2"]
    ]

//func randomizer(n:Int ) -> [Int] {
//    var result:[Int] = Array(1...n)
//    var i = 0
//    while i <= n {
//        var x = 0
//        var idx = Int(arc4random_uniform(UInt32(n)))
//        if i == 0 {
//            result[i] = idx
//            i += 1
//        }
//        if (i != 0){
//            while x <= i{
//                if (result[x] != idx){
//                    x += 1
//                }else {
//                    idx = Int(arc4random_uniform(UInt32(n)))
//                    x = 0
//                }
//                if (x == i){
//                    result[i] = idx
//                    i += 1
//                    x += 1
//                }
//            }
//        }
//    }
//    return result
//}
//randomizer(n: 9)

let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: quizQs)





let idx: Int = Int(arc4random_uniform(UInt32(6 - 0 + 1)))
idx

let q1 = quizQs[0]

func getQuestion() -> String{
    return quizQs[0]["Question"]!
}
