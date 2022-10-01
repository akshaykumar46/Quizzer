//
//  QuizBrain.swift
//  Quizzer
//
//  Created by AKSHAY KUMAR on 30/09/22.
//

import Foundation
struct QuizBrain{
    let quiz=[
        Question(ques: "This is the first ques", ans: "True"),
        Question(ques: "This is the second ques", ans: "False"),
        Question(ques: "This is the third ques", ans: "False"),
        Question(ques: "This is the fourth ques", ans: "True"),
        Question(ques: "This is the fifth ques", ans: "True"),
        Question(ques: "This is the six ques", ans: "False")
        
    ]
    var quesNumber = -1
    func isCorrectAnswer(_ answerSelected : String)->Bool{
        if quiz[quesNumber].ans == answerSelected{
            return true
        }else{
            return false
        }
    }
    
    mutating func nextQues(){
        if quesNumber + 1 < quiz.count {
                    quesNumber += 1
                } else {
                    quesNumber = 0
                }
    }
    func question()->String{
        print(quesNumber)
        return quiz[quesNumber].ques
        
    }
    func isEndOfQuiz()->Bool{
        if quiz.count==quesNumber+1{
            return true
        }else{
            return false
        }
    }
    mutating func replay(){
        quesNumber = -1
    }
    func progress()->Float{
        return Float(quesNumber)/Float(quiz.count)
    }
    
}
