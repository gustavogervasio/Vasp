@testable import Vasp
import XCTest

class SearchPresenterTests: XCTestCase {

    func testPresentSearchShouldHideButton() {
        // Given
        let outputSpy = SearchPresenterOutputSpy()
        let sut = SearchPresenter(output: outputSpy)
        let search = SearchModel()

        // When
        sut.presentSearch(search: search)

        // Then
        XCTAssertFalse(outputSpy.displayButtonCalled)
        XCTAssertTrue(outputSpy.hideButtonCalled)
    }

    func testPresentSearchShouldDisplayButton() {
        // Given
        let outputSpy = SearchPresenterOutputSpy()
        let sut = SearchPresenter(output: outputSpy)
        let search = SearchModel(
            from: "CGH",
            to: "CNF",
            departDate: "20191010",
            returnDate: "20191011",
            numberOfPassengers: 1
        )

        // When
        sut.presentSearch(search: search)

        // Then
        XCTAssertTrue(outputSpy.displayButtonCalled)
        XCTAssertFalse(outputSpy.hideButtonCalled)
    }

    func testPresentResultShouldDisplayResult() {
        // Given
        let outputSpy = SearchPresenterOutputSpy()
        let sut = SearchPresenter(output: outputSpy)
        let search = SearchModel()

        // When
        sut.presentResult(search: search)

        // Then
        XCTAssertTrue(outputSpy.displayResultCalled)
    }

    // MARK: Spy
    class SearchPresenterOutputSpy: SearchPresenterOutput {

        var displayButtonCalled = false
        var hideButtonCalled = false
        var displayResultCalled = false

        func displayButton() {
            displayButtonCalled = true
        }

        func hideButton() {
            hideButtonCalled = true
        }

        func displayResult(search: SearchModel) {
            displayResultCalled = true
        }
    }
}
