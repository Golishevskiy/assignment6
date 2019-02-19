//
//  ViewController.swift
//  assignment#6
//
//  Created by Per Pert on 2/15/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 0
    var history = [String].init()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        let number = UserDefaults.standard.integer(forKey: "key")
        labelText.text = String(number)
        let textHistory = UserDefaults.standard.array(forKey: "YAZZ") ?? [""]
        for i in textHistory as! [String] {
            textView.text += (i) + "\n"
            print(i)
            history.append(i) // for the next session
        }
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        let numberTextField = textFieldTextToInt(text: textField.text)
        let numberTextView = textFieldTextToInt(text: textView.text)
        let sumNumber = numberTextField + numberTextView
        labelText.text = String(sumNumber)
        textField.text = ""
        textView.text = String(sumNumber)
        textView.font = .systemFont(ofSize: CGFloat(sumNumber))
        oneLineText(numOne: numberTextField, numTwoo: numberTextView, numSum: sumNumber)
        UserDefaults.standard.set(history, forKey: "YAZZ")
    }
    
    func textFieldTextToInt(text: String?) -> Int {
        let textToString = text ?? ""
        let textToInt = Int(textToString) ?? 0
        return textToInt
    }
    
    func oneLineText(numOne: Int, numTwoo: Int, numSum: Int) {
        let resultString = String(numOne) + " + " + String(numTwoo) + " = " + String(numSum)
        history.append(resultString)
    }
}

