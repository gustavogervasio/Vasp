@testable import Vasp
import XCTest

class ResponseFailureModelTests: XCTestCase {

    func testShouldParseError() {
        let failure = ResponseFailureModel(error: ConsumerError.unknown)
        XCTAssertEqual(failure.code, .unknownError)
        XCTAssertEqual(failure.message, "Custom")
    }
}
