//
//  ThreadSafeArray.swift
//  Swift_ReaderWriterProblem
//
//  Created by Rahul Dubey on 4/11/21.
//

import Foundation

// Generic Implementation of Thread Safe Array
final class ThreadSafeArray<T> {
    
    private var array: [T] = []
    
    private let threadSafeQueue = DispatchQueue(label: "threadsafe.array", attributes: .concurrent)
    
    init(repeating: T, count: Int) {
        array = Array(repeating: repeating, count: count)
    }
    
    // When doing writes we need to block other threads from writing that's where dispatch barrier is good
    public func append(newElement: T) {
        threadSafeQueue.async(flags: .barrier) {
            self.array.append(newElement)
        }
    }
    
    public var count: Int {
        var count = 0
        threadSafeQueue.sync {
            count = self.array.count
        }
        return count
    }
    
    var lastElement: T? {
        var lastElement: T?
        threadSafeQueue.sync {
            if !self.array.isEmpty {
                lastElement = self.array.last
            }
        }
        return lastElement
    }
    
    var firstElement: T? {
        var firstElement: T?
        threadSafeQueue.sync {
            if !self.array.isEmpty {
                firstElement = self.array.first
            }
        }
        return firstElement
    }
}

