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
    @IBOutlet var performanceValue: UILabel!
    @IBOutlet var performanceSlider: UISlider!
    @IBOutlet var overallFeelings: UISegmentedControl!
    var overallFeelingsText = "Neutral"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSliders()
        setUpSteppers()
        // Do any additional setup after loading the view.
    }
    
    
    func setUpSliders() {
        performanceSlider.maximumValue = 5.9
        performanceSlider.minimumValue = 1
        performanceSlider.isContinuous = true
    }
    
    func setUpSteppers() {
        enjoymentStepper.wraps = false
        enjoymentStepper.autorepeat = true
        enjoymentStepper.maximumValue = 5
        enjoymentStepper.minimumValue = 1
    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        outputLabel.text = commentGenerator.simpleComment(enjoymentValue: Int(enjoymentValue!.text!) ?? 0, performanceValue: Int(performanceValue!.text!) ?? 0, subject: subjectInput!.text ?? "error", overallFeelingsText: overallFeelingsText)
    }
    @IBAction func enjoymentValueChange(_ sender: UIStepper) {
        enjoymentValue.text = Int(sender.value).description
    }
    
    @IBAction func performaceValueChange(_ sender: UISlider) {
        performanceValue.text = Int(sender.value).description
    }
    
    @IBAction func overallFeelingsChange(_ sender: UISegmentedControl) {
        overallFeelingsText = overallFeelings.titleForSegment(at: overallFeelings.selectedSegmentIndex) ?? "Error"
    }
}

