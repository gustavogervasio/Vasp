 @testable import Vasp
 @testable import Moya
 import XCTest

 class SearchAPIConsumerTests: XCTestCase {

    func testSearchAPIConsumerShouldFetchResult() {

        let expectation = self.expectation(description: "testSearchAPIConsumerShouldFetchResult")

        let sut = SearchAPIConsumer(provider: MoyaProvider<SearchAPI>(stubClosure: MoyaProvider.immediatelyStub))

        sut.fetchSearch(
            from: "CGH",
            to: "CNF",
            departure: "20191010",
            returnDate: "20191011",
            passengers: 1)
        { response in

            XCTAssertNotNil(response.success)
            XCTAssertNil(response.failure)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
 }
