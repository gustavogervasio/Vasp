@testable import Vasp
import XCTest

class ResultInteractorTests: XCTestCase {

    func testFetchSearchShouldAskResultWorkerToFetchSearch() {
        // Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)

        // When
        sut.fetchSearch(search: SearchModel())

        // Then
        XCTAssertTrue(workerSpy.fetchSearchCalled)
    }

    func testFetchSearchShouldAskPresenterToFormatSearch() {
        // Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)
        // When
        sut.fetchSearch(search: SearchModel())

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
        XCTAssertFalse(outputSpy.presentErrorCalled)
    }

    func testFetchSearchShouldAskPresenterToPresentErrorIfError() {
        // Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)
        workerSpy.fetchSearchError = true

        // When
        sut.fetchSearch(search: SearchModel())

        // Then
        XCTAssertFalse(outputSpy.presentSearchCalled)
        XCTAssertTrue(outputSpy.presentErrorCalled)
    }

    func testSortByPriceShouldNotAskPresenterToFormatSearchWhenResultIsEmpty() {
        //Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)

        // When
        sut.sortByPrice()

        // Then
        XCTAssertFalse(outputSpy.presentSearchCalled)
    }

    func testSortByPriceShouldAskPresenterToFormatSearch() {
        //Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)

        guard let result = Data.codable(type: SearchResultModel.self) else {
            return XCTAssertNotNil(nil, "SearchResultModel could not be nil")
        }
        sut.result = result

        // When
        sut.sortByPrice()

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    func testFilterByAirlineShouldNotAskPresenterToFormatSearchWhenResultIsEmpty() {
        //Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)

        // When
        sut.filterByAirline(airline: "LATAM")

        // Then
        XCTAssertFalse(outputSpy.presentSearchCalled)
    }

    func testFilterByAirlineShouldAskPresenterToFormatSearch() {
        //Given
        let outputSpy = ResultInteractorOutputSpy()
        let workerSpy = ResultWorkerSpy()
        let sut = ResultInteractor(output: outputSpy, worker: workerSpy)
        guard let result = Data.codable(type: SearchResultModel.self) else {
            return XCTAssertNotNil(nil, "SearchResultModel could not be nil")
        }
        sut.result = result

        // When
        sut.filterByAirline(airline: "LATAM")

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    // MARK: Spy
    class ResultInteractorOutputSpy: ResultInteractorOutput {

        var presentSearchCalled = false
        var presentErrorCalled = false

        func presentSearchResult(searchResult: SearchResultModel) {
            presentSearchCalled = true
        }

        func presentError(error: ResponseFailureModel) {
            presentErrorCalled = true
        }
    }

    class ResultWorkerSpy: ResultWorkerProtocol {

        var fetchSearchCalled = false
        var fetchSearchError = false

        func fetchSearch(search: SearchModel, completionHandler: @escaping (ResponseModel<SearchResultModel>) -> Void) {

            fetchSearchCalled = true

            if fetchSearchError {

                completionHandler(ResponseModel(success: nil, error: ConsumerError.unknown))

            } else {

                guard let result = Data.codable(type: SearchResultModel.self) else {
                    return completionHandler(ResponseModel(success: nil, error: ConsumerError.codable))
                }
                completionHandler(ResponseModel(success: result, error: nil))
            }
        }
    }
}
