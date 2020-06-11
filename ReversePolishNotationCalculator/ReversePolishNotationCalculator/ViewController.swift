//
//  ViewController.swift
//  ReversePolishNotationCalculator
//
//  Created by Bryson, David (IRG) on 10/06/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputDisplay: UILabel!
    @IBOutlet var enterButton: UIButton!
    
    var outputStack:[String] = []
    var currentInput = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func zero(_ sender: Any) {
        currentInput += "0"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func one(_ sender: Any) {
        currentInput += "1"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func two(_ sender: Any) {
        currentInput += "2"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func three(_ sender: Any) {
        currentInput += "3"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func four(_ sender: Any) {
        currentInput += "4"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func five(_ sender: Any) {
        currentInput += "5"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func six(_ sender: Any) {
        currentInput += "6"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func seven(_ sender: Any) {
        currentInput += "7"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func eight(_ sender: Any) {
        currentInput += "8"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func nine(_ sender: Any) {
        currentInput += "9"
        reloadDisplay()
        enterButton.isEnabled = true
    }
    @IBAction func clear(_ sender: Any) {
        outputStack = []
        currentInput = ""
        reloadDisplay()
        enterButton.isEnabled = false
    }
    @IBAction func signSwitch(_ sender: Any) {
        var currentInteger = Int(currentInput) ?? 0
        currentInteger = currentInteger * -1
        currentInput = String(currentInteger)
        reloadDisplay()
    }
    @IBAction func plus(_ sender: Any) {
        addToStack()
        outputStack.append("+")
        reloadDisplay()
        enterButton.isEnabled = false
    }
    @IBAction func minus(_ sender: Any) {
        addToStack()
        outputStack.append("-")
        reloadDisplay()
        enterButton.isEnabled = false
    }
    @IBAction func times(_ sender: Any) {
        addToStack()
        outputStack.append("*")
        reloadDisplay()
        enterButton.isEnabled = false
    }
    @IBAction func divide(_ sender: Any) {
        addToStack()
        outputStack.append("/")
        reloadDisplay()
        enterButton.isEnabled = false
    }
    
    @IBAction func enter(_ sender: Any) {
        if Int(currentInput)! > 999 || Int(currentInput)! < -999 {
            let alertController = UIAlertController(title: "Invalid number", message: "Numbers must be between -999 and 999", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "I understand", style: .default))
            self.present(alertController, animated: true, completion: nil)
            currentInput = ""
        } else {
        addToStack()
        }
        reloadDisplay()
        enterButton.isEnabled = false
    }
    
    func addToStack() {
        outputStack.append(String(Int(currentInput)!))
        currentInput = ""
    }
    
    func reloadDisplay() {
        outputDisplay.text = ""
        for operand in outputStack {
            outputDisplay.text! += operand
        }
        outputDisplay.text! += currentInput
    }
    
    func initialise() {
        outputDisplay.text = ""
        enterButton.isEnabled = false
    }
}

