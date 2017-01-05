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
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
    }
    
}

extension MainViewController {
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == .authorized {
                
            }
        }
    }
    
}
