//
//  ViewController.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  private var homeViewModel: HomeViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    //Initialize the HomeViewModel
    homeViewModel = HomeViewModel.init(withId: 1)
  }
  
  deinit {
    print("Deinitialized HomeViewController")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

