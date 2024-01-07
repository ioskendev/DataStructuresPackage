import XCTest
@testable import DataStructuresPackage

final class DataStructuresPackageTests: XCTestCase {
	
	// Arrange
	var sut: LinkedList<String>!
	
	// Act
	override func setUp() {
		super.setUp()
		sut = LinkedList<String>()
	}
	override func tearDown() {
		super.tearDown()
		sut = nil
	}
	
	// Assert
	func test_empty_withoutElements_shouldBeTrue() {
		XCTAssertTrue(sut.isEmpty, "Linked List не является пустым и содержит значения")
	}
	func test_empty_withElements_shouldBeFalse(){
		sut.push("test")
		XCTAssertFalse(sut.isEmpty, "Linked List является пустым и не поместил значения в список")
	}
	func test_push_shouldBeEqual() {
		sut.push("test")
		XCTAssertEqual(sut.count, 1, "Linked List колличество элементов в списке не корректно")
	}
	func test_count_threeElements_shouldBeEqual() {
		sut.push("one")
		sut.push("two")
		sut.push("three")
		XCTAssertEqual(sut.count, 3, "Linked List колличество элементов в списке не корректно")
	}
	func test_append_element_shouldBeEqual() {
		sut.append("first")
		XCTAssertEqual(sut.value(at: 0), "first")
	}
	func test_insert_element_shouldBeEqual() {
		sut.push("first")
		sut.push("third")
		sut.insert("second", after: 0)
		XCTAssertEqual(sut.value(at: 0), "third")
		XCTAssertEqual(sut.value(at: 1), "second")
		XCTAssertEqual(sut.value(at: 2), "first")
	}
	
	func test_pop_element_shouldBeEqual() {
		sut.push("first")
		sut.push("second")
		let poppedValue = sut.pop()
		XCTAssertEqual(poppedValue, "second")
		XCTAssertEqual(sut.value(at: 0), "first")
	}
	func test_removeLast_element_shouldBeEqual() {
		sut.push("first")
		sut.push("second")
		let removedValue = sut.removeLast()
		XCTAssertEqual(removedValue, "first")
		XCTAssertEqual(sut.value(at: 0), "second")
	}
	func test_removeAfter_element_shouldBeEqual() {
		sut.push("first")
		sut.push("second")
		sut.push("third")
		let removedValue = sut.remove(after: 0)
		XCTAssertEqual(removedValue, "second")
		XCTAssertEqual(sut.value(at: 0), "third")
		XCTAssertEqual(sut.value(at: 1), "first")
	}
	func test_removeFirst_element_shouldBeEqual() {
		sut.push("first")
		sut.push("second")
		sut.push("third")
		let removedIndex = sut.remove(first: "second")
		XCTAssertEqual(removedIndex, 1)
		XCTAssertEqual(sut.value(at: 0), "third")
		XCTAssertEqual(sut.value(at: 1), "first")
	}
	func test_find_element_shouldBeEqual() {
		sut.push("first")
		sut.push("second")
		sut.push("third")
		let foundIndex = sut.find(value: "second")
		XCTAssertEqual(foundIndex, 1)
	}
}
