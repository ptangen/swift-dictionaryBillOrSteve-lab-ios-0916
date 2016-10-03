//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your stored properties here
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    @IBAction func steveButtonAction(_ sender: UIButton) {
        if correctPerson == "Steve Jobs" {
            updateScore()
            showFact()
        }
    }
    
    @IBAction func billButtonAction(_ sender: UIButton) {
        if correctPerson == "Bill Gates" {
            updateScore()
            showFact()
        }
    }
    
    func updateScore(){
        var scoreCounterInt = 0
        let scoreCounterText: String? = scoreCounter.text
        if let scoreCounterText = scoreCounterText {
            scoreCounterInt = Int(scoreCounterText)!
            scoreCounterInt += 1
            scoreCounter.text = String(scoreCounterInt)
            
        }
    }
    
    var correctPerson: String = ""
    var scoreCounterText: String = ""
    
    func showFact(){
        let randomFact = getRandomFacts()
        print (randomFact)
        factLabel.text = randomFact.1
        correctPerson = randomFact.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    // Create your stored property here
    var billAndSteveFacts: [String : [String]] = [:]
    

    func createFacts() {
        let billFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        let steveFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts
    }
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func getRandomFacts() -> (String, String){
        let person = randomPerson()
        var randomFact: String = ""
        let factsArray = billAndSteveFacts[person]
        if let factsArray = factsArray {
            randomFact = factsArray[randomIndex(fromArray: factsArray)]
        }
        return (person, randomFact)
    }
    
}
