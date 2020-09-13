import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(accounts_new_movementTests.allTests),
    ]
}
#endif
