//
//  ViewController.swift
//  Quizzer
//
//  Created by AKSHAY KUMAR on 16/09/22.
//

import UIKit
struct Question{
    var ques:String
    var ans:String
}
var quiz=[
    Question(ques: "This is the first ques", ans: "True"),
    Question(ques: "This is the second ques", ans: "False"),
    Question(ques: "This is the third ques", ans: "False"),
    Question(ques: "This is the fourth ques", ans: "True"),
    Question(ques: "This is the fifth ques", ans: "True"),
    Question(ques: "This is the six ques", ans: "False")
    
]
class ViewController: UIViewController {

    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
   
    var quesNumber = -1
    @IBAction func AnswerButton(_ sender: UIButton) {
        if quiz[quesNumber].ans == sender.currentTitle!{
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
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
        trueButton.backgroundColor=UIColor.white
        falseButton.backgroundColor=UIColor.white
        
        print(quesNumber,quiz.count)
        quesNumber+=1
        progressBar.progress=Float(quesNumber)/Float(quiz.count)
        
        if quiz.count==quesNumber+1{
            // create the alert
            let alert = UIAlertController(title: "Quizzer", message: "You have completed all the questions!!!", preferredStyle: UIAlertController.Style.alert)

                // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: {_ in self.replay()}))
//                alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.cancel, handler: { _ in
//                print("Exit Button got pressed!")
//                exit(0) //not recommended by apple
//            }))
        

                   // show the alert
           self.present(alert, animated: true, completion: nil)
        }
        
        QuestionLabel.text=quiz[quesNumber].ques
        
    }
    func replay(){
        quesNumber=0
        progressBar.progress=0
        print("Game restarted!!")
    }


}

