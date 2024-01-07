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
