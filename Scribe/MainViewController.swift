//
//  ViewController.swift
//  Scribe
//
//  Created by Kacy James on 1/5/17.
//  Copyright © 2017 Student Driver. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var transcriptionTextField: UITextView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    var audioPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
    }
    
}

extension MainViewController {
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == .authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        sound.play()
                    } catch {
                        print("Something went wrong!")
                    }
                }
            }
        }
    }
}
