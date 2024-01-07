//
//  File.swift
//  
//
//  Created by Alexey Turulin on 1/6/24.
//

import XCTest
@testable import DataStructuresPackage

final class NodeTests: XCTestCase {
	
	func test_init_withValue_shouldReturnNodeWithCorrectValue() {

		let sut = LinkedList<Int>.Node(42)

		XCTAssertEqual(sut.value, 42)
	}

	func test_init_withValue_shouldBeNilPreviousNode() {

		let sut = LinkedList<Int>.Node(42)

		XCTAssertNil(sut.previous)
	}

	func test_init_withValue_shouldBeNilNextNode() {

		let sut = LinkedList<Int>.Node(42)

		XCTAssertNil(sut.next)
	}

	func test_init_withValueAndPreviousNode_shouldReturnPreviousNodeWithCorrectValue() {

		let previousNode = LinkedList<Int>.Node(41)

		let sut = LinkedList<Int>.Node(42, previous: previousNode)

		XCTAssertEqual(sut.previous?.value, 41)
	}

	func test_init_withValueAndNextNode_shouldReturnNextNodeWithCorrectValue() {

		let nextNode = LinkedList<Int>.Node(43)

		let sut = LinkedList<Int>.Node(42, next: nextNode)

		XCTAssertEqual(sut.next?.value, 43)
	}

	func test_description_withValue_shouldReturnStringWithCorrectvalue() {

		let sut = LinkedList<Int>.Node(42)

		XCTAssertEqual(sut.description, "42")
	}
}
