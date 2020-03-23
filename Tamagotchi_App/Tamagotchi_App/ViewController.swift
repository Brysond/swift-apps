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
    @IBOutlet var excrement: UILabel!
    
    
    let tamagotchi = Tamagotchi()
    
    var timer: Timer?
    var secondsTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 6.00, target: self, selector: #selector(age), userInfo: nil, repeats: true)
        secondsTimer = Timer.scheduledTimer(timeInterval:1.00, target: self, selector: #selector(excrementCleanup),userInfo:nil, repeats:true)
        updateDisplay()
    }
    
    @IBAction func eat(_ sender: Any) {
        tamagotchi.getFatter(increase:6)
        updateDisplay()
    }
    @IBAction func snack(_ sender: Any) {
        tamagotchi.getFatter(increase:3)
        updateDisplay()
    }
    @IBAction func cleanup(_ sender: Any) {
        tamagotchi.excrementOnScreen = false
        excrementChecker()
    }
    
    @objc func age() {
        tamagotchi.getOlder()
        updateDisplay()
    }
    
    func excrementChecker() {
        let ifExcrement = tamagotchi.excrement()
        if ifExcrement == true {
            excrement.text = "💩"
        } else {
            excrement.text = ""
        }
    }
    
    func weightChecker() {
        if tamagotchi.weight == 200 {
            deathAlert(why:"It got too fat")
        }
    }
    
    @objc func excrementCleanup() {
        if tamagotchi.excrementOnScreen == true {
            tamagotchi.getLessHealthy()
            updateDisplay()
            if tamagotchi.health == 0 {
                deathAlert(why: "There was poo on the screen for too long")
                tamagotchi.excrementOnScreen = false
            }
        }
    }
    
    func deathAlert(why: String) {
        let death = UIAlertController(title: "Tamagotchi died", message: why, preferredStyle: UIAlertController.Style.alert)
        self.present(death,animated:false)
    }
    
    func updateDisplay() {
        tamagotchiStatsLabel.text = "\(tamagotchi.statsOutput())"
        excrementChecker()
        weightChecker()
    }

    
    

}

