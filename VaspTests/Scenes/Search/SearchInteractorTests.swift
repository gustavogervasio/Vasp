@testable import Vasp
import XCTest

class SearchInteractorTests: XCTestCase {

    func testDidUpdateFromShouldAskPresenterToFormatSearch() {
        // Given
        let outputSpy = SearchInteractorOutputSpy()
        let interactor = SearchInteractor(output: outputSpy)

        // When
        interactor.didUpdateFrom(airport: "CGH")

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    func testDidUpdateToShouldAskPresenterToFormatSearch() {
        // Given
        let outputSpy = SearchInteractorOutputSpy()
        let interactor = SearchInteractor(output: outputSpy)

        // When
        interactor.didUpdateTo(airport: "CGH")

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    func testDidUpdateDepartShouldAskPresenterToFormatSearch() {
        // Given
        let outputSpy = SearchInteractorOutputSpy()
        let interactor = SearchInteractor(output: outputSpy)

        // When
        interactor.didUpdateDepart(date: "20191010")

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    func testDidUpdateReturnShouldAskPresenterToFormatSearch() {
        // Given
        let outputSpy = SearchInteractorOutputSpy()
        let interactor = SearchInteractor(output: outputSpy)

        // When
        interactor.didUpdateReturn(date: "20191011")

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    func testDidUpdateNumberOfPassengersShouldAskPresenterToFormatSearch() {
        // Given
        let outputSpy = SearchInteractorOutputSpy()
        let interactor = SearchInteractor(output: outputSpy)

        // When
        interactor.didUpdateNumberOfPassengers(passengers: "1")

        // Then
        XCTAssertTrue(outputSpy.presentSearchCalled)
    }

    func testDidTapSearchButtonShouldAskPresenterToResult() {
        // Given
        let outputSpy = SearchInteractorOutputSpy()
        let interactor = SearchInteractor(output: outputSpy)

        // When
        interactor.didTapSearchButton()

        // Then
        XCTAssertTrue(outputSpy.presentResultCalled)
    }

    // MARK: Spy
    class SearchInteractorOutputSpy: SearchInteractorOutput {

        var presentSearchCalled = false
        var presentResultCalled = false

        func presentSearch(search: SearchModel) {
            presentSearchCalled = true
        }

        func presentResult(search: SearchModel) {
            presentResultCalled = true
        }
    }
}
