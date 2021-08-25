import Foundation

// CalendarManager.swift

@objc(CalendarManager)
class CalendarManager: NSObject {
  
  @objc func addEvent(name: String, location: String, date: NSNumber) -> Void {
    NSLog("%@ %@ %S", name, location, date);
  }
  
}
