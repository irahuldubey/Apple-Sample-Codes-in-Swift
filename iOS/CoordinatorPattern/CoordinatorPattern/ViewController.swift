//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Rahul Dubey on 3/7/21.
//

import UIKit

class ViewController: UIViewController, Storyboard {
    
    weak var newC: MainCoOrdinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        newC?.buySubscription()
    }
    
    @IBAction func createAccount(_ sender: Any) {
        newC?.createAccount()
    }
}



