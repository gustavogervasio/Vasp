@testable import Vasp
import XCTest
import UIKit

class SearchViewControllerTests: XCTestCase {

    private var window: UIWindow!

    override func setUp() {
        window = UIWindow()
        super.setUp()
    }
    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // # MARK: Tests
    func testInitShouldSetViewControllerOutput() {
        // When
        let sut = SearchViewController()

        // Then
        XCTAssertNotNil(sut.output)
    }

    func testInitShouldSetInteractorOutput() {
        // When
        let sut = SearchViewController()

        // Then
        XCTAssertNotNil(sut.output as? SearchInteractor)
    }

    func testInitShouldSetPresenterOutput() {
        // When
        let sut = SearchViewController()

        // Then
        if let interactor = sut.output as? SearchInteractor {

            XCTAssertNotNil(interactor.output as? SearchPresenter)

        } else {

            XCTFail("should not be nil")
        }
    }

    func  testViewShouldBeSearchView() {
        // Given
        let sut = SearchViewController()

        // When
        loadView(window: window, viewController: sut)

        // Then
        XCTAssertNotNil(sut.view as? SearchView)
    }

    func testShouldHaveATitle() {
        // Given
        let sut = SearchViewController()

        // When
        loadView(window: window, viewController: sut)

        // Then
        XCTAssertEqual(sut.title, R.string.applicationName)
    }

    func testSearchViewUpdateFromShouldCallInteractor() {
        // Given
        let outputSpy = SearchViewControllerOutputSpy()
        let sut = SearchViewController()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView.delegate?.searchView(view: SearchView(), didUpdateFrom: "CGH")

        // Then
        XCTAssertTrue(outputSpy.didUpdateFromCalled)
    }

    func testSearchViewUpdateToShouldCallInteractor() {
        // Given
        let outputSpy = SearchViewControllerOutputSpy()
        let sut = SearchViewController()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView.delegate?.searchView(view: SearchView(), didUpdateTo: "CGH")

        // Then
        XCTAssertTrue(outputSpy.didUpdateToCalled)
    }

    func testSearchViewUpdateDepartShouldCallInteractor() {
        // Given
        let outputSpy = SearchViewControllerOutputSpy()
        let sut = SearchViewController()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView.delegate?.searchView(view: SearchView(), didUpdateDepart: "20191010")

        // Then
        XCTAssertTrue(outputSpy.didUpdateDepartCalled)
    }

    func testSearchViewUpdateReturnShouldCallInteractor() {
        // Given
        let outputSpy = SearchViewControllerOutputSpy()
        let sut = SearchViewController()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView.delegate?.searchView(view: SearchView(), didUpdateReturn: "20191010")

        // Then
        XCTAssertTrue(outputSpy.didUpdateReturnCalled)
    }

    func testSearchViewUpdateNumberOfPassengersShouldCallInteractor() {
        // Given
        let outputSpy = SearchViewControllerOutputSpy()
        let sut = SearchViewController()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView.delegate?.searchView(view: SearchView(), didUpdateNumberOfPassengers: "1")

        // Then
        XCTAssertTrue(outputSpy.didUpdateNumberOfPassengersCalled)
    }

    func testSearchViewTapButtonShouldCallInteractor() {
        // Given
        let outputSpy = SearchViewControllerOutputSpy()
        let sut = SearchViewController()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView.delegate?.searchView(view: SearchView(), didTapButton: UIButton())

        // Then
        XCTAssertTrue(outputSpy.didTapSearchButtonCalled)
    }

    class SearchViewControllerOutputSpy: SearchViewControllerOutput {

        var didUpdateFromCalled = false
        var didUpdateToCalled = false
        var didUpdateDepartCalled = false
        var didUpdateReturnCalled = false
        var didUpdateNumberOfPassengersCalled = false
        var didTapSearchButtonCalled = false

        func didUpdateFrom(airport: String) {
            didUpdateFromCalled = true
        }

        func didUpdateTo(airport: String) {
            didUpdateToCalled = true
        }

        func didUpdateDepart(date: String) {
            didUpdateDepartCalled = true
        }

        func didUpdateReturn(date: String) {
            didUpdateReturnCalled = true
        }

        func didUpdateNumberOfPassengers(passengers: String) {
            didUpdateNumberOfPassengersCalled = true
        }

        func didTapSearchButton() {
            didTapSearchButtonCalled = true
        }
    }
}
