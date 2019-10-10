//
//  ViewController.swift
//  Xylophone
//
//  Created by Christian Jimenez on 10/08/2019.
//  Copyright © 2019 Oavi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    // AVAudioPlayer Object declaration
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileName : String = ""
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {

        selectedSoundFileName = soundArray[sender.tag - 1]
        
        // Calls playSound Functionallity
        playSound()

    }
    
    func playSound() {
        // Variable that sets up where the location of our sound files are in our project
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        // Try to setup audioPlayer with the contents of soundURL
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        
        // Play audio
        audioPlayer.play()
    }
}

