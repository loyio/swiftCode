//
//  ViewController.swift
//  HelloWorldApp
//
//  Created by Loyio on 2021/1/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMessage(sender: UIButton) {
        let emojiDict: [String: String] = ["👻": "Ghost",
                                           "🤖️": "Robot",
                                           "🤪": "Zany face",
                                           "👑": "Crown"
                                            ]
        let selectedButton = sender
        
        if let wordToLookup = selectedButton.titleLabel?.text {
            let meaning = emojiDict[wordToLookup]
            let alertController = UIAlertController(title: "Meaning", message: meaning, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
}

