//
//  ViewModel.swift
//  Binding
//
//  Created by Rahul Dubey on 3/18/21.
//

import Foundation

class ViewModel {
    
    var name = BindingValue<String>(with: "Initial")
    
    init() { }
    
    func callWebService() {
        APIClient.callWebService { (result) in
            print("HOHO",result)
            switch(result) {
            case .success(let result):
                self.name.value = result.description
            case .failure(let error):
                print("Error", error)
            }
        }
    }
}

