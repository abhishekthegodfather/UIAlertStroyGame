//
//  ViewController.swift
//  StoryTellingApp
//
//  Created by Cubastion on 12/04/23.
//

import UIKit


struct makeStroyChoices {
    var storyLine : String
    var correctChoices : Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var startStoryBtn : UIButton!
    
    var storyArray : [makeStroyChoices] = []
    var curretSitutaions : Int = 0
    var indiStoryElement : makeStroyChoices!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareStory()
        startStoryBtn.addTarget(self, action: #selector(startStoryBtn(_ :)), for: .touchUpInside)
    }
    
    
    func prepareStory(){
        storyArray = [
            makeStroyChoices(storyLine: "Someone shouts for help in an old house. Do you open the door?", correctChoices: true),
            makeStroyChoices(storyLine: "You are in the house. Do you take the stairs?", correctChoices: false),
            makeStroyChoices(storyLine: "Suddenly a spirit attacks! Do you run?", correctChoices: false),
            makeStroyChoices(storyLine: "It turns out the spirit just wanted to say hello. Do you accept?", correctChoices: true)
                    ]
    }
    
    
    
    
    @objc func startStoryBtn(_ sender : UIButton){
        indiStoryElement = storyArray[curretSitutaions]
        showOptionsWay(message: indiStoryElement)
        
    }
    
    func nextThings(){
        
        curretSitutaions += 1
        if curretSitutaions == storyArray.count {
            gameWon()
            return
        }
        
        indiStoryElement = storyArray[curretSitutaions]
        showOptionsWay(message: indiStoryElement)
    }
    
    func gameOver() {
        showAlertOptions(title: "Game Lost", message: "You Have Made Some Bad Decision")
    }
    
    func gameWon(){
        showAlertOptions(title: "Game Won", message: "You Won The Game by taking good decision")
    }
    
    
    func showAlertOptions(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default){ (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showOptionsWay(message: makeStroyChoices) {
        
        let currentDecision : Bool = message.correctChoices
        let storyElement : String = message.storyLine
        let alert = UIAlertController(title: "Choose The Pathway", message: storyElement, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            if currentDecision == true {
                self.nextThings()
            }else{
                self.gameOver()
            }
        }
        
        let noAction = UIAlertAction(title: "No", style: .default) { (action) in
            if currentDecision == false {
                self.nextThings()
            }else{
                self.gameOver()
            }
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
}



