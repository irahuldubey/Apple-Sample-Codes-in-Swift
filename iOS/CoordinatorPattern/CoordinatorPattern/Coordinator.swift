//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Rahul Dubey on 3/7/21.
//

import Foundation
import UIKit

protocol Coordiantor {
    
    var childCoordiantors: [Coordiantor] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func createAccount()
    
    func buySubscription()
    
}
