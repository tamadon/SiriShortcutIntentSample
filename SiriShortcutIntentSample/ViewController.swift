//
//  ViewController.swift
//  SiriShortcutIntentSample
//
//  Created by tamadon on 2018/12/04.
//  Copyright © 2018 tamadon. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    @IBOutlet weak var toppingLabel: UILabel!
    @IBOutlet weak var toppingTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!

    public var topping: String = "ニンニク入れますか？" {
        didSet {
            toppingLabel.text = topping
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        toppingTextField.delegate = self
    }

    @IBAction func tapResetButton(_ sender: UIButton) {
        topping = "ニンニク入れますか？"
        toppingTextField.text = nil
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        guard let text = textField.text, text.count > 0 else {
            return false
        }

        topping = text
        toppingTextField.text = nil

        let intent = ToppingIntent()
        intent.topping = text

        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { error in
            if let error = error as NSError? {
                print(error.localizedDescription)
            }
        }

        return true
    }
}
