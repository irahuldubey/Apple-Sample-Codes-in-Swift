//
//  BindingValue.swift
//  Binding
//
//  Created by Rahul Dubey on 3/18/21.
//

import Foundation

class BindingValue<T> {
    
    var listener: ((T?) -> Void)?
    
    init(with value: T?) {
        self.value = value
    }
    
    func bind(listener: @escaping (T?) -> Void) {
        self.listener = listener
    }
    
    var value: T? {
        didSet {
            if let listenerValue = listener {
                listenerValue(value)
            }
        }
    }
}
