//
//  ViewController.swift
//  commentCardWriter
//
//  Created by Bryson, David (IRG) on 25/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let commentGenerator = CommentGenerator()
    @IBOutlet var enjoymentStepper: UIStepper!
    @IBOutlet var outputLabel: UILabel!
    @IBOutlet var enjoymentValue: UILabel!
    @IBOutlet var nameInput: UITextField!
    @IBOutlet var subjectInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enjoymentStepper.wraps = false
        enjoymentStepper.autorepeat = true
        enjoymentStepper.maximumValue = 5
        enjoymentStepper.minimumValue = 1
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func doneButton(_ sender: Any) {
        
        outputLabel.text = commentGenerator.simpleComment(value: enjoymentValue!.text ?? "", subject: subjectInput!.text ?? "error")
    }
    @IBAction func enjoymentValueChange(_ sender: UIStepper) {
        enjoymentValue.text = Int(sender.value).description
    }
}

