//
//  ViewController.swift
//  iSiri
//
//  Created by DUBEY, RAHUL on 4/24/19.
//  Copyright © 2019 DUBEY, RAHUL. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {
  
  @IBOutlet weak var siriTextView: UITextView! {
    didSet {
      siriTextView.text = "Tell me how I can help you?"
      siriTextView.textColor = .blue
    }
  }
  
  @IBOutlet weak var siriButton: UIButton!
  
  private let speechRecognizer = SFSpeechRecognizer(locale: Locale.current)  
  
  private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
  
  private var recognitionTask: SFSpeechRecognitionTask?
  
  private let audioEngine = AVAudioEngine()

  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    siriButton.isEnabled = false
    
    speechRecognizer?.delegate = self
    
    SFSpeechRecognizer.requestAuthorization { (authStatus) in
      
      var isButtonEnabled = false
      
      switch authStatus {  //5
        
      case .authorized:
        
        isButtonEnabled = true
        
      case .denied, .restricted, .notDetermined:
        
        isButtonEnabled = false
        
        print("Not authorized")
      }
      
      OperationQueue.main.addOperation() {
        self.siriButton.isEnabled = isButtonEnabled
      }
    }
    
  }

  @IBAction func wakeUpSiri(_ sender: Any) {
    if audioEngine.isRunning {
      audioEngine.stop()
      recognitionRequest?.endAudio()
      siriButton.isEnabled = false
      siriButton.setTitle("Start Recording", for: .normal)
    } else {
      startRecording()
      siriButton.setTitle("Stop Recording", for: .normal)
    }
  }
  
  
  private func startRecording() {
    
    if recognitionTask != nil {
      recognitionTask?.cancel()
      recognitionTask = nil
    }
  
    let audioSession = AVAudioSession.sharedInstance()
    
    do {
      try audioSession.setCategory(.record, mode: .default, options: .defaultToSpeaker)
      try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    } catch {
      print("audioSession properties weren't set because of an error.")
    }
    
    recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    
    let inputNode = audioEngine.inputNode
    
    guard let recognitionRequest = recognitionRequest else {
      
      return
      
    }
    
    recognitionRequest.shouldReportPartialResults = true
    
    recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
      
      var isFinal = false
      
      if result != nil {
        
        self.siriTextView.text = result?.bestTranscription.formattedString
        
        if let isFinalResult = result?.isFinal, isFinalResult {
          isFinal = isFinalResult
        }

      }
      
      
      if error != nil || isFinal {
        
        self.audioEngine.stop()
        
        inputNode.removeTap(onBus: 0)
        
        self.recognitionRequest = nil
        
        self.recognitionTask = nil
        
        self.siriButton.isEnabled = true
      }
    })
    
    let recordingFormat = inputNode.outputFormat(forBus: 0)
    
    inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
      self.recognitionRequest?.append(buffer)
    }
    
    audioEngine.prepare()
    
    do {
      try audioEngine.start()
    } catch {
      print("audioEngine couldn't start because of an error.")
    }
    
  }
}

