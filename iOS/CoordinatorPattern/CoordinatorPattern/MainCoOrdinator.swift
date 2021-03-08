//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Rahul Dubey on 3/7/21.
//

import Foundation
import UIKit

class MainCoOrdinator: Coordiantor {
    
    var childCoordiantors: [Coordiantor] = [Coordiantor]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.newC = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
