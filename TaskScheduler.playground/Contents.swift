//: Playground - noun: a place where people can play

import UIKit

//Create a task scheduler in Swift 4

class TaskScheduler {
  
  typealias TimerCompletion = ((Timer) -> ())?
  private var timer: Timer?
  
  public func scheduleTask(withTimeInterval interval: TimeInterval, shouldRepeat: Bool, task: TimerCompletion) {
    DispatchQueue.main.async {
      let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: shouldRepeat, block: { (timer) in
          task?(timer)
      })
    }
  }
}
