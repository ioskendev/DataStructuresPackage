import XCTest
@testable import DataStructuresPackage

final class DataStructuresLinkedListTests: XCTestCase {

	enum ValuesStub: Int {
		case five = 5
	}

	private var sut: LinkedList<Int>!

	override func setUp() {
		sut = LinkedList<Int>()
	}

	override func tearDown() {
		sut = nil
	}

	func test_isEmpty_shouldBeFalseWhenLinkedListWithValues() throws {
		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")
	}

	func test_push_sutShouldContainValue() {
		let newValue = ValuesStub.five

		XCTAssertTrue(sut.isEmpty, "LinkedList must be empty becouse it's was init without value: LinkedList<Int>()")

		sut.push(newValue.rawValue)

		XCTAssertFalse(sut.isEmpty, "LinkedList can't be empty becouse we pushing newValue: sut.push(newValue)")

		XCTAssertNotNil(sut.find(value: newValue.rawValue), "LinkedList can't be empty becouse we pushing new value: sut.push(newValue)")
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
