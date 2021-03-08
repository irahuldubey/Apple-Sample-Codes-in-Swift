//
//  Storyboard.swift
//  CoordinatorPattern
//
//  Created by Rahul Dubey on 3/7/21.
//

import Foundation
import UIKit

protocol Storyboard {
    static func instantiate() -> Self
}


extension Storyboard where Self: UIViewController {
    static func instantiate() -> Self {
            // this pulls out "MyApp.MyViewController"
            let fullName = NSStringFromClass(self)

            // this splits by the dot and uses everything after, giving "MyViewController"
            let className = fullName.components(separatedBy: ".")[1]

            // load our storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

            // instantiate a view controller with that identifier, and force cast as the type that was requested
            return storyboard.instantiateViewController(withIdentifier: className) as! Self
        }
}
