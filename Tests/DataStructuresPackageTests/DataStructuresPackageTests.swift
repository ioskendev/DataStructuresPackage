import XCTest
@testable import DataStructuresPackage

final class DataStructuresPackageTests: XCTestCase {
	
	var sut: LinkedList<String>!
	
	override func setUp() {
		super.setUp()
		sut = LinkedList<String>()
	}
	
	func test_empty_withoutElements_shouldBeTrue() {
		XCTAssertTrue(sut.isEmpty)
	}
	
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
