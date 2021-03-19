//
//  ViewController.swift
//  Binding
//
//  Created by Rahul Dubey on 3/18/21.
//

import UIKit

class ViewController: UIViewController {

    var vmObj: ViewModel = ViewModel()
    
    private var label: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vmObj.name.bind { (name) in
            print("HHHH", name)
        }
        
        vmObj.callWebService()
    }
}

