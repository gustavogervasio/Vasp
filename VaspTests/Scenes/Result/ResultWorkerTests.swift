@testable import Vasp
import XCTest

class ResultWorkerTests: XCTestCase {

    func testFetchSearchAskSearchAPIConsumerToFetchSearch() {
        // Given
        let consumer = SearchAPIConsumerSpy()
        let sut = ResultWorker(consumer: consumer)
        let search = SearchModel()

        // When
        sut.fetchSearch(search: search) { _ in }

        // Then
        XCTAssertTrue(consumer.fetchWithCompletionHandlerCalled)
    }

    // MARK: Spy
    class SearchAPIConsumerSpy: SearchAPIConsumerProtocol {

        var fetchWithCompletionHandlerCalled = false

        func fetchSearch(
            from: String,
            to: String,
            departure: String,
            returnDate: String,
            passengers: Int,
            completionHandler: @escaping (ResponseModel<SearchResultModel>) -> Void) {


            fetchWithCompletionHandlerCalled = true
        }
    }
}
