import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(xcodeproj_modifyTests.allTests),
    ]
}
#endif