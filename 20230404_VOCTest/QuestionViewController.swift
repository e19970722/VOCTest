//
//  QuestionViewController.swift
//  20230404_VOCTest
//
//  Created by Yen Lin on 2023/4/4.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var index: Int = 0
    var score: Int = 0
    var correct: Bool = true
    var vocTest = [
        Question(voc: "Feasible", answer: "可行的", options: ["可行的","熱情的","可笑的","最新的"]),
        Question(voc: "Adjacent", answer: "鄰近的", options: ["適當的","正確的","鄰近的","有活力的"]),
        Question(voc: "Comprehensive", answer: "綜合的", options: ["共同的","對比的","相對的","綜合的"])
    ]
    
    var wrongVOC: String = ""
    
    
    
    @IBOutlet weak var vocLabel: UILabel!
    @IBOutlet var optionsButton: [UIButton]!
    @IBOutlet weak var endTest: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endTest.isHidden = true
        
        //單字出題隨機
        vocTest.shuffle()
        updateUI()
    }
    
    
    
    

    func updateUI(){
        vocLabel.text = vocTest[index].voc
        
        //單字選項隨機
        let vocOptions = vocTest[index].options.shuffled()
        optionsButton[0].setTitle(vocOptions[0], for: .normal)
        optionsButton[1].setTitle(vocOptions[1], for: .normal)
        optionsButton[2].setTitle(vocOptions[2], for: .normal)
        optionsButton[3].setTitle(vocOptions[3], for: .normal)
        
    }

    
    func next() {
    
        if index < vocTest.count-1 {
            index += 1
            updateUI()
        }else{
            endTest.isHidden = false
            vocLabel.text = "測驗結束"
            optionsButton[0].isHidden = true
            optionsButton[1].isHidden = true
            optionsButton[2].isHidden = true
            optionsButton[3].isHidden = true
            backButton.isHidden = true
            skipButton.isHidden = true
        }
    }
    
    func previous() {
 
        if index >= 0{
            index -= 1
            updateUI()
        }
    }
 
    
    
    
    
    
    
    //跳過到下一題
    @IBAction func skipQuestion(_ sender: Any) {
        next()
    }
    
    //上一題
    @IBAction func backQuestion(_ sender: Any) {
        previous()
    }
    
    //結束作答，傳送分數到下一頁
    @IBSegueAction func showScore(_ coder: NSCoder) -> ScoreViewController? {
        
        let controller = ScoreViewController(coder: coder)
        controller?.myscore = score
        controller?.mywrongVOC = wrongVOC
        
        return controller
    }
    
    
    
    @IBAction func pressButton0(_ sender: UIButton) {
        if sender.title(for: .normal) == vocTest[index].answer{
            score += 10
        }else{
            wrongVOC += "\(vocTest[index].voc) \(vocTest[index].answer) \(sender.titleLabel?.text ?? "")\n"
        }
        next()
    }
    
    @IBAction func pressButton1(_ sender: UIButton) {
        if sender.title(for: .normal) == vocTest[index].answer{
            score += 10
        }else{
            wrongVOC += "\(vocTest[index].voc) \(vocTest[index].answer) \(sender.titleLabel?.text ?? "")\n"
        }
        next()
    }
    
    @IBAction func pressButton2(_ sender: UIButton) {
        if sender.title(for: .normal) == vocTest[index].answer{
            score += 10
        }else{
            wrongVOC += "\(vocTest[index].voc) \(vocTest[index].answer) \(sender.titleLabel?.text ?? "")\n"
        }
        next()
    }
    
    @IBAction func pressButton3(_ sender: UIButton) {
        if sender.title(for: .normal) == vocTest[index].answer{
            score += 10
        }else{
            wrongVOC += "\(vocTest[index].voc) \(vocTest[index].answer) \(sender.titleLabel?.text ?? "")\n"
        }
        next()
    }
    
}
