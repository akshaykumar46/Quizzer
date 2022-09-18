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
    
    let ques:[[String]] = [["This is first ques1.","True"],["this is second ques","False"],["this is third ques","True"]]
   
    var quesNumber = -1;
    @IBAction func AnswerButton(_ sender: UIButton) {
        
        if ques[quesNumber][1] == sender.currentTitle!{
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
        if quesNumber+1==ques.count{
            quesNumber=0
        }else{
            quesNumber+=1
        }
        QuestionLabel.text=ques[quesNumber][0]
        
       
    }


}

