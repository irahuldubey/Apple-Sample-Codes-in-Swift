


//Throttling in iOS/tvOS/macOS

import Foundation

class ThrottleHandler
  
{
  let interval: TimeInterval
  let block: ()->()
  
  fileprivate var source: DispatchSourceTimer?
  
  init(interval: TimeInterval, block: @escaping ()->()) {
    self.interval = interval
    self.block = block
  }
  
  func fire() {
    if let source = source {
      source.cancel()
    }
    
    source = nil
    
    let dispatchSource = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: UInt(0)), queue: DispatchQueue.main)
    
    let time = DispatchTime.now() + Double(Int64(interval) * Int64(NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
    
    dispatchSource.scheduleRepeating(deadline: time, interval: DispatchTimeInterval.seconds(5), leeway: DispatchTimeInterval.seconds(0))
    
    dispatchSource.setEventHandler { [weak self] in
      if let block = self?.block {
        block()
      }
      
      if let source = self?.source {
        source.cancel()
      }
      
      self?.source = nil
    }
    
    dispatchSource.resume()
    
    source = dispatchSource
  }
}
