import XCTest
@testable import NewMovement

final class NewMovementTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(accounts_new_movement().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
