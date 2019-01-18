@testable import Vasp
import XCTest

class ErrorParserTests: XCTestCase {

    func testShouldResponseObject() {
        let objectParser = ErrorParser(jsonData: Data.mocked(type: SearchResultModel.self))
        XCTAssertNotNil(objectParser.response())
    }

    func testShouldResponseNil() {
        let objectParser = ErrorParser(jsonData: Data())
        XCTAssertNil(objectParser.response())
    }
}

