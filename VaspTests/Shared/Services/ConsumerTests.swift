@testable import Vasp
import Moya
import XCTest

class ConsumerTests: XCTestCase {

    func testConsumerShouldResponseParse() {

        let stubbingProvider = MoyaProvider<SearchAPI>(stubClosure: MoyaProvider.immediatelyStub)
        let expectation = self.expectation(description: "testConsumerShouldResponseParse")

        let _ = Consumer(stubbingProvider).request(.fetch(
            from: "CGH",
            to: "CNF",
            departure: "20191010",
            returnDate: "20191011",
            passengers: 1
        )) { (response: ResponseModel<SearchResultModel>) in

            XCTAssertNotNil(response.success)
            XCTAssertNil(response.failure)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 30, handler: nil)
    }

    func testConsumerFailure() {

        let stubbingProvider = MoyaProvider<SearchAPI>(stubClosure: MoyaProvider.immediatelyStub)
        let expectation = self.expectation(description: "testConsumerFailure")

        let _ = Consumer(stubbingProvider).request(.fetch(
            from: "CGH",
            to: "CNF",
            departure: "20191010",
            returnDate: "20191011",
            passengers: 1
        )) { (response: ResponseModel<String>) in

            XCTAssertNil(response.success)
            XCTAssertNotNil(response.failure)
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30, handler: nil)
    }
}

