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
		XCTAssertTrue(sut.isEmpty)
	}
	func test_empty_withoutElements_shouldBeFalse(){
		sut.push("test")
		XCTAssertFalse(sut.isEmpty)
	}
	
	
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}
