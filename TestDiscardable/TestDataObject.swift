//
//  TestDataObject.swift
//  TestDiscardable
//
//

import Foundation

 public class TestDataObject: NSDiscardableContent {
	public func beginContentAccess() -> Bool {
		if data != nil {
			// print("debug counter start: \(counter)")
			counter += 1
			// print("debug counter after: \(counter)")
			return true
		}
		return false
	}
	
	public func endContentAccess() {
		if counter != 0 {
			counter -= 1
		}
	}
	
	public func discardContentIfPossible() {
		print("discarding...")
		if counter == 0 {
			data = nil
		}
	}
	
	public func isContentDiscarded() -> Bool {
		counter == 0
	}
	
	public func printArray() {
		print("count: \(counter)")
		if beginContentAccess() {
			print(data!)
			endContentAccess()
		} else {
			print("data discarded")
		}
	}
	
	public func reallocate(_ value: Array<String>) {
		guard data == nil, counter == 0 else {
			print("ERROR")
			return
		}
		data = value
	}
	
	public func debug() {
		print("counter: \(counter)")
		print("data is: \(data == nil ? "nil" : "not nil")")
	}
	
	init(value: Array<String>?) {
		if value != nil {
			data = value
		} else {
			data = ["a", "b", "c", "d"]
		}
	}
	var data: Array<String>? = nil
	private var counter = 1
}
