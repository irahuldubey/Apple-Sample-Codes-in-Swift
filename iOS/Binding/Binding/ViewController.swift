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
        
     print(compressString("aaabb"))
        
//        vmObj.name.bind { (name) in
//            print("HHHH", name)
//        }
//
//        vmObj.callWebService()
    }
    
    func compressString(_ inputString: String) -> String? {
        
        guard !inputString.isEmpty else {
            return nil
        }
        
        let charArray = Array.init(inputString)
        var index = 0
        var resultString = ""
        
        while index < charArray.count {
            var charCount: Int = 1
            let initialCharacter = charArray[index]
            // If the next element is same
            while index + 1 < charArray.count && charArray[index] == charArray[index + 1] {
                charCount = charCount + 1
                index = index + 1
            }
            index = index + 1
            resultString = resultString + "\(charCount)\(initialCharacter)"
        }
        return !resultString.isEmpty ? resultString : nil
    }
}

