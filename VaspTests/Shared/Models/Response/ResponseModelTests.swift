@testable import Vasp
import XCTest

class ResponseModelTests: XCTestCase {

    func testShouldResponseSuccess() {
        let step = Data.codable(type: SearchResultModel.self)
        let response = ResponseModel<SearchResultModel>(success: step, error: nil)

        XCTAssertNotNil(response.success)
        XCTAssertNil(response.failure)
    }

    func testShouldResponseFailure() {
        let response = ResponseModel<SearchResultModel>(success: nil, error: ConsumerError.unknown)

        XCTAssertNil(response.success)
        XCTAssertNotNil(response.failure)
    }

    func testWhenSuccessAndErrorAreAvailableTheResponseShouldDiscardTheError() {
        let step = Data.codable(type: SearchResultModel.self)
        let error = ConsumerError.unknown

        let response = ResponseModel<SearchResultModel>(success: step, error: error)

        XCTAssertNotNil(response.success)
        XCTAssertNil(response.failure)
    }
}
