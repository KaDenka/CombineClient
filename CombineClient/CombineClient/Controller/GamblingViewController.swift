//
//  GamblingViewController.swift
//  CombineClient
//
//  Created by Denis Kazarin on 16.02.2022.
//

import UIKit
import Combine

class GamblingViewController: UIViewController {
    
    //MARK: - Creating labels and buttons
    
    @IBOutlet weak var emojiOne: UILabel!
    @IBOutlet weak var emojiTwo: UILabel!
    @IBOutlet weak var emojiThree: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    //MARK: - Add some properties for gaming
    
    var buttonStarted: Bool = false
    let emojiArray: [String] = ["🍎", "🍋", "🍐"]       //Have possibility to add some, "🍑", "🍒", "🍇"]
    
    //MARK: - Create Combine elements
    
    var subscriptions: Set<AnyCancellable> = []
    let timer = Timer.publish(every: 0.5, on: RunLoop.main, in: .default)
    
    //MARK: - Create allerts
    
    let alertWin = UIAlertController(title: "Winner", message: "You won the game!", preferredStyle: .alert)
    let alertLose = UIAlertController(title: "Loser", message: "You lost the game!", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertWin.addAction(UIAlertAction(title: "WooHoo", style: .default, handler: nil))
        alertLose.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    }
    
    
    //MARK: - Create game functions
    
    func playGame() {
        timer.autoconnect()
            .sink { _ in
                self.emojiTwo.text = self.emojiArray.randomElement()
                self.emojiOne.text = self.emojiArray.randomElement()
                self.emojiThree.text = self.emojiArray.randomElement()
        }
            .store(in: &subscriptions)
    }
    
    func stopGame() {
        timer.connect().cancel()
        if emojiOne.text == emojiTwo.text && emojiOne.text == emojiThree.text {
            self.present(alertWin, animated: true, completion: nil)
        } else {
            self.present(alertLose, animated: true, completion: nil)
        }
    }
    
    //MARK: - Create button action
    
    @IBAction func startStopButtonTapped() {
        if buttonStarted == false {
            buttonStarted = true
            playGame()
        } else {
            buttonStarted = false
            stopGame()
        }
    }
}
