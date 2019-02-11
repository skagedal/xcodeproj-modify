import XCTest

import xcodeproj_modifyTests

var tests = [XCTestCaseEntry]()
tests += xcodeproj_modifyTests.allTests()
XCTMain(tests)