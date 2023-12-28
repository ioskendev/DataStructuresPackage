//
//  QueueList.swift
//
//
//  Created by ioskendev on 28.12.2023.
//

import Foundation

struct QueueList<T: Equatable> {

	private var linkedList = LinkedList<T>()
	
	/// linked list count
	var count: Int {
		linkedList.count
	}

	/// Queue list empty status as Bool value, where true - emtu list and false - not empty list
	var isEmpty: Bool {
		linkedList.isEmpty
	}
	
	/// Appending value to queue list
	/// - Parameter value: Equatable value to appending to linked list
	mutating func enqueue(_ element: T) {
		linkedList.append(element)
	}
	
	/// Cut value from start of the list
	/// - Returns: Cutting value
	mutating func dequeue() -> T? {
		linkedList.pop()
	}
	
	/// Adding value to beginning of the list.
	/// - Returns: Adding value if adding was success (else return nil)
	var peek: T? {
		linkedList.value(at: 0)
	}
}
