//
//  ScoreViewController.swift
//  20230404_VOCTest
//
//  Created by Yen Lin on 2023/4/5.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var myscore: Int!
    var mywrongVOC: String!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var mywrongVOCLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(myscore)
        mywrongVOCLabel.text = mywrongVOC
        
    }
}
