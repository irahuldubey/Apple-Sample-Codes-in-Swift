//
//  ViewController.swift
//  SampleARKit
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSessionDelegate {

  //Create an instance of ARSession
  let session: ARSession = ARSession()
  
  //Create a world tracking configuration
  let configuration = ARWorldTrackingConfiguration()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Run the configuration
    session.run(configuration)
    
    //Set the delegate to self 
    session.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: ARSessionDelegate
  func session(_ session: ARSession, didUpdate frame: ARFrame) {
    
  }
}

