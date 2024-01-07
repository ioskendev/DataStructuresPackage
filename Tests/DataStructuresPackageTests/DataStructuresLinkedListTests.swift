import XCTest
@testable import DataStructuresPackage

final class DataStructuresLinkedListTests: XCTestCase {

	enum ValuesStub: Int {
		case two = 2
		case three = 3
		case five = 5
		case nine = 9
		case failIntTestValue = 999999 // value to test failing variant
	}

	private var sut: LinkedList<Int>!

	override func setUp() {
		sut = LinkedList<Int>()
	}

	override func tearDown() {
		sut = nil
	}

	func test_isEmpty_shouldBeFalseWhenLinkedListWithValues() throws {
		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init with LinkedList without value: LinkedList<Int>()")
	}

	func test_push_sutShouldContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.five
		let failIntTestValue = ValuesStub.failIntTestValue

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		sut.push(firstValue.rawValue)

		XCTAssertFalse(sut.isEmpty, "LinkedList can't be empty becouse we pushing newValue: sut.push(newValue)")

		XCTAssertNotNil(sut.find(value: firstValue.rawValue), "LinkedList must contain newValue becouse we has pushed new value: sut.push(firstValue)")

		sut.push(secondValue.rawValue)

		XCTAssertNotNil(sut.find(value: secondValue.rawValue), "LinkedList must contain secondValue becouse we has pushed secondValue: sut.push(secondValue)")

		XCTAssertNil(sut.find(value: failIntTestValue.rawValue), "LinkedList can't contain failIntTestValue becouse we don't pushing failIntTestValue")

		XCTAssertEqual(
			sut.count,
			2,
			"Количество незавершенных задач в task manager не соответствует исходным параметрам"
		)
	}

	func test_append_sutShouldContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.five
		let failIntTestValue = ValuesStub.failIntTestValue

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		sut.append(firstValue.rawValue)

		XCTAssertFalse(sut.isEmpty, "LinkedList can't be empty becouse we pushing newValue: sut.push(newValue)")

		XCTAssertNotNil(sut.find(value: firstValue.rawValue), "LinkedList must contain newValue becouse we has pushed with new value: sut.push(firstValue)")

		sut.append(secondValue.rawValue)

		XCTAssertNotNil(sut.find(value: secondValue.rawValue), "LinkedList must contain secondValue becouse we has pushed secondValue: sut.push(secondValue)")

		XCTAssertNil(sut.find(value: failIntTestValue.rawValue), "LinkedList can't contain failIntTestValue becouse we don't pushing failIntTestValue")
	}

	func test_insert_sutShouldContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.three
		let thirdValue = ValuesStub.five
		let failIntTestValue = ValuesStub.failIntTestValue

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		sut.insert(firstValue.rawValue, after: 0)

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value and we can't insert value after not existing element (no index found must be found in LinkedList): LinkedList<Int>() -> sut.insert(firstValue.rawValue, after: 0) must add no values")

		sut.append(firstValue.rawValue)

		XCTAssertFalse(sut.isEmpty, "LinkedList can't be empty becouse we append firstValue: sut.push(firstValue)")
		XCTAssertEqual(sut.count, 1, "sut count must be 2 after appending 2 values")

		sut.append(secondValue.rawValue)

		XCTAssertEqual(sut.count, 2, "sut count must be 2 after appending 2 values")

		sut.insert(thirdValue.rawValue, after: 0)

		XCTAssertNotNil(sut.find(value: thirdValue.rawValue), "LinkedList must contain thirdValue becouse we was insert thirdValue: sut.insert(thirdValue.rawValue, after: 0)")

		sut.insert(firstValue.rawValue, after: 10)

		XCTAssertEqual(sut.count, 3, "sut count must be 3 becouse we have only 3 values and haven't index more than (3 - 1 = 2)")
	}

	func test_pop_sutShouldNotContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.three

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		XCTAssertNil(sut.pop(), "Nothing to pop from empty list")

		sut.append(firstValue.rawValue)

		XCTAssertEqual(sut.count, 1, "sut count must be 1 after appending 1 value")

		sut.append(secondValue.rawValue)

		XCTAssertEqual(sut.count, 2, "sut count must be 2 after appending 2 values")

		XCTAssertEqual(sut.pop(), firstValue.rawValue, "Must cut value from start of list. pop() must returns firstValue from list")

		XCTAssertEqual(sut.count, 1, "sut count must be 1 after sut.pop()")

		XCTAssertEqual(sut.pop(), secondValue.rawValue, "Must cut value from start of list. pop() must returns secondValue from list")

		XCTAssertEqual(sut.count, 0, "sut count must be 0 after pop 2 values from 2 values list")

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse all values was deleted from list")
	}

	func test_removeLast_sutShouldNotContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.three

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		XCTAssertNil(sut.removeLast(), "Nothing to remove from empty list")

		sut.append(firstValue.rawValue)

		XCTAssertEqual(sut.count, 1, "sut count must be 1 after appending 1 value")

		sut.append(secondValue.rawValue)

		XCTAssertEqual(sut.count, 2, "sut count must be 2 after appending 2 values")

		XCTAssertEqual(sut.removeLast(), secondValue.rawValue, "Must cut value from end of list. pop() must returns secondValue from list")

		XCTAssertEqual(sut.count, 1, "sut count must be 1 after sut.pop()")

		XCTAssertEqual(sut.removeLast(), firstValue.rawValue, "Must cut value from end of list. pop() must returns firstValue from list")

		XCTAssertEqual(sut.count, 0, "sut count must be 0 after removing 2 values from 2 values list")

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse all values was deleted from list")
	}

	func test_removeAfterIndex_sutShouldNotContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.three

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		XCTAssertNil(sut.remove(after: 0), "Nothing to remove from empty list")
		XCTAssertNil(sut.remove(after: 10), "Nothing to remove from empty list")
		XCTAssertNil(sut.remove(after: -10), "Nothing to remove from empty list")

		sut.append(firstValue.rawValue)

		XCTAssertEqual(sut.count, 1, "sut count must be 1 after appending 1 value")

		sut.append(secondValue.rawValue)

		XCTAssertEqual(sut.count, 2, "sut count must be 2 after appending 2 values")

		XCTAssertNotEqual(sut.remove(after: -1), firstValue.rawValue, "Must nothing to delete becouse it is not valid index")

		XCTAssertEqual(sut.remove(after: 0), secondValue.rawValue, "Must delete secondValue becouse it was append after firstValue with zero(0) index")

		XCTAssertEqual(sut.count, 1, "sut count must be 1 after removing")

		XCTAssertEqual(sut.removeLast(), firstValue.rawValue, "Must cut value from end of list. pop() must returns firstValue from list")

		XCTAssertEqual(sut.count, 0, "sut count must be 0 after removing 2 values from 2 values list")

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse all values was deleted from list")
	}

	func test_removeFirstValue_sutShouldNotContainValues() {
		let firstValue = ValuesStub.two
		let secondValue = ValuesStub.three
		let thirdValue = ValuesStub.five
		let fouthValue = ValuesStub.nine
		
		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")
		
		XCTAssertNil(sut.remove(first: thirdValue.rawValue), "Nothing to remove from empty list")
		
		sut.append(firstValue.rawValue)
		sut.append(secondValue.rawValue)
		sut.append(thirdValue.rawValue)
		sut.append(fouthValue.rawValue)
		
		XCTAssertEqual(sut.remove(first: thirdValue.rawValue), 2, "Must delete thirdValue with 2 index")
		
		XCTAssertEqual(sut.count, 3, "sut count must be 3 after removing 1 value from list of 4 values")
		XCTAssertNotEqual(sut.find(value: thirdValue.rawValue), thirdValue.rawValue, "sut count must be 1 after removing")
	}
}

// TODO: make test with LinkedList

//var list = LinkedList<Int>()
//
//list.push(5)
//list.push(2)
//
//print(list) // 2 -> 5
//list.append(3)
//list.append(9)
//
//print(list) // 2 -> 5 -> 3 -> 9
//list.insert(1, after: 1)
//
//print(list) // 2 -> 5 -> 1 -> 3 -> 9
//list.pop()
//
//print(list) // 5 -> 1 -> 3 -> 9
//list.removeLast()
//
//print(list) // 5 -> 1 -> 3
//list.remove(after: 0)
//
//print(list) // 5 -> 3
//list.append(4)
//list.append(9)
//
//print(list) // 5 -> 3 -> 4 -> 9
//list.remove(first: 4)
//list.remove(after: 0)
//
//print(list) // 5 -> 9

// TODO: to make tests with queueList

//var queueList = QueueList<String>()
//
//queueList.enqueue("First")
//queueList.enqueue("Second")
//queueList.enqueue("Third")
//queueList.enqueue("Fouth")
//queueList.enqueue("Firth")
//
//queueList.isEmpty
//
//queueList.count
//
//print(queueList)
//
//queueList.dequeue()
//
//queueList.count
//
//print(queueList)
//
//queueList.dequeue()
//
//queueList.count
//
//print(queueList)
//
//queueList.peek()
//
//print(queueList)
