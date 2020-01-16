//
//  ViewController.swift
//  Tamagotchi_App
//
//  Created by Bryson, David (IRG) on 14/01/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tamagotchiStatsLabel: UILabel!
    
    
    let tamagotchi = Tamagotchi()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 6.00, target: self, selector: #selector(age), userInfo: nil, repeats: true)
        updateDisplay()
    }
    
    @IBAction func eat(_ sender: Any) {
        tamagotchi.getFatter()
        updateDisplay()
    }
    
    @objc func age() {
        tamagotchi.getOlder()
        updateDisplay()
    }
    
    func updateDisplay() {
        tamagotchiStatsLabel.text = "\(tamagotchi.statsOutput())"
    }

    
    

}

