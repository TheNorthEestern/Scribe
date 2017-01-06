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
    
    @IBAction func transcribeButtonWasPressed(_ sender: UIButton) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuthorization()
    }
}

extension MainViewController : AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == .authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("Something went wrong!")
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("There was an error: \(error)")
                        } else {
                            self.transcriptionTextField.text = (result?.bestTranscription.formattedString)! as String
                        }
                    }
                    
                }
            }
        }
    }
}
