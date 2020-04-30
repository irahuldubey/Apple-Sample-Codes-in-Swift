//
//  ViewController.swift
//  YTVideoPlayer
//
//  Created by Rahul Dubey on 6/17/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var ytPlayerView: YTPlayerView!
  
  @IBOutlet weak var textField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //laod the video with the given Id/ playlist id
    //ytPlayerView.load(withVideoId: "lWA2pjMjpBs")
    ytPlayerView.load(withPlaylistId: "PLFZTWIMMzuD0FaBpQjYskuOI_OQMyUi4K")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func play(_ sender: Any) {
    ytPlayerView.playVideo()
  }
  
  @IBAction func stop(_ sender: Any) {
    ytPlayerView.stopVideo()
  }
  
  @IBAction func pause(_ sender: Any) {
    ytPlayerView.pauseVideo()
  }

  @IBAction func playNextVideo(_ sender: Any) {
    DispatchQueue.main.async {
      self.ytPlayerView.nextVideo()
    }
  }
  
  @IBAction func playPreviousVideo(_ sender: Any) {
    DispatchQueue.main.async {
      self.ytPlayerView.previousVideo()
    }
  }
  
}

