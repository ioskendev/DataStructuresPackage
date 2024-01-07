//
//  DataStructuresQueueListTests.swift
//
//
//  Created by ioskendev team on 08.01.2024.
//

import XCTest
@testable import DataStructuresPackage

final class DataStructuresQueueListTests: XCTestCase {
	private var sut: QueueList<Int>!

	override func setUp() {
		sut = QueueList<Int>()
	}

	override func tearDown() {
		sut = nil
	}

	func test_count_shouldBeSameAsValuesInLinkedList() throws {
		let newValue = ValuesStub.firstValue

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init with LinkedList without value: LinkedList<Int>()")

		sut.enqueue(newValue.rawValue)

		XCTAssertEqual(sut.count, 1, "Sut count must be 1 after appending 1 value")

		sut.enqueue(newValue.rawValue)

		XCTAssertEqual(sut.count, 2, "Sut count must be 2 after appending 2 values")

		sut.enqueue(newValue.rawValue)

		XCTAssertEqual(sut.count, 3, "Sut count must be 3 after appending 3 values")

		XCTAssertNotNil(sut.dequeue(), "Must return value to test sut.count")

		XCTAssertEqual(sut.count, 2, "Sut count must be 2 after removing value from 3 values in LinkedList")

		XCTAssertNotNil(sut.dequeue(), "Must return value to test sut.count")
		XCTAssertNotNil(sut.dequeue(), "Must return value to test sut.count")

		XCTAssertEqual(sut.count, 0, "Sut count must be 2 after appending 2 values")

		XCTAssertNil(sut.dequeue(), "Nothing to remove - must return nil")

		XCTAssertTrue(sut.isEmpty, "List must be empty after trying to remove from empty list")
	}

}
