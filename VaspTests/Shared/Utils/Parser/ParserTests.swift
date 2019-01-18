@testable import Vasp
import XCTest

class ParserTests: XCTestCase {

    func testShouldResponseObject() {
        let objectParser = Parser<SearchResultModel>(jsonData: Data.mocked(type: SearchResultModel.self))
        let parsedResponse = objectParser.response()
        XCTAssertNotNil(parsedResponse.response)
        XCTAssertNil(parsedResponse.error)
    }

    func testShouldResponseError() {
        let objectParser = Parser<String>(jsonData: Data.mocked(type: SearchResultModel.self))
        let parsedResponse = objectParser.response()
        XCTAssertNil(parsedResponse.response)
        XCTAssertNotNil(parsedResponse.error)
    }
}


