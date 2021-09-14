//
//  ViewController.swift
//  EggTimer
//
//  Created by VG on 08/07/2021.
//  Copyright © 2021 The Vineet Geek. All rights reserved.


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let time = ["Soft": 5, "Medium": 7, "Hard": 12]

    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()

        let hardness = sender.currentTitle!

        totalTime = time[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            print(secondsPassed)
            
           
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
            
    } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
    

    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
    
    
    

}
        

