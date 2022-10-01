//
//  ViewController.swift
//  Quizzer
//
//  Created by AKSHAY KUMAR on 16/09/22.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
 
    var brain=QuizBrain()
    @IBAction func AnswerButton(_ sender: UIButton) {
        if brain.isCorrectAnswer(sender.currentTitle!){
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }

        if brain.isEndOfQuiz() {
                    // create the alert
                let alert = UIAlertController(title: "Quizzer", message: "You have completed all the questions!!!", preferredStyle: UIAlertController.Style.alert)

                        // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { [self]_ in

                brain.replay()
                progressBar.progress=0
                updateQues()
                print("Game restarted!!")
                    }))
//                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.cancel, handler: { _ in
//                print("Exit Button got pressed!")
//                exit(0) //not recommended by apple
//            }))
                   // show the alert
           self.present(alert, animated: true, completion: nil)
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQues), userInfo: nil, repeats: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQues()
       
        
        trueButton.layer.borderWidth = 3
        trueButton.layer.cornerRadius = 5
        trueButton.layer.borderColor = UIColor.black.cgColor
        falseButton.layer.borderWidth = 3
        falseButton.layer.cornerRadius = 5
        falseButton.layer.borderColor = UIColor.black.cgColor
        
    }
    @objc func updateQues(){
//        print(brain.quesNumber,brain.quiz.count)
        trueButton.backgroundColor=UIColor.white
        falseButton.backgroundColor=UIColor.white
        brain.nextQues()
        if brain.quesNumber<brain.quiz.count{
            QuestionLabel.text=brain.question()
        }
        progressBar.progress=brain.progress()
    }
  


}

