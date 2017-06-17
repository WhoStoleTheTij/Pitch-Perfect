//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Richard H on 15/06/2017.
//  Copyright © 2017 Richard H. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton:UIButton!
    @IBOutlet weak var chipmunkButton:UIButton!
    @IBOutlet weak var rabbitButton:UIButton!
    @IBOutlet weak var vaderButton:UIButton!
    @IBOutlet weak var echoButton:UIButton!
    @IBOutlet weak var reverbButton:UIButton!
    @IBOutlet weak var stopButton:UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode:AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int{ case slow = 0, fast, chipmunk, vader, echo, reverb }
    
    // Mark: playSoundForButton
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch:1000)
        case .vader:
            playSound(pitch:-1000)
        case .echo:
            playSound(echo:true)
        case .reverb:
            playSound(reverb:true)
        }
        
        configureUI(.playing)
    }
    
    // Mark: stopButtonPressed
    
    @IBAction func stopButtonPressed(_sender: UIButton){
        stopAudio()
    }

    // Mark: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    // Mark viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        configureUI(.notPlaying)
    }


}
