@testable import Vasp
import XCTest
import UIKit

class SearchViewTests: XCTestCase {

    func testSetEnableFalseShouldHideButton() {
        // Given
        let sut = SearchView()

        // When
        sut.setEnabled(enabled: false)

        // Then
        XCTAssertEqual(sut.searchTicketsButton.alpha, 0.5)
        XCTAssertFalse(sut.searchTicketsButton.isEnabled)
    }

    func testSetEnableTrueShouldDisplayButton() {
        // Given
        let sut = SearchView()

        // When
        sut.setEnabled(enabled: true)

        // Then
        XCTAssertEqual(sut.searchTicketsButton.alpha, 1)
        XCTAssertTrue(sut.searchTicketsButton.isEnabled)
    }

    func testFromTextField() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertEqual(sut.fromTextField.keyboardType, .asciiCapable)
        XCTAssertEqual(sut.fromTextField.autocapitalizationType, .allCharacters)
        XCTAssertEqual(sut.fromTextField.placeholder, R.string.fromPlaceholder)
    }

    func testToTextField() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertEqual(sut.toTextField.keyboardType, .asciiCapable)
        XCTAssertEqual(sut.toTextField.autocapitalizationType, .allCharacters)
        XCTAssertEqual(sut.toTextField.placeholder, R.string.toPlaceholder)
    }

    func testDepartTextField() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertEqual(sut.departTextField.keyboardType, .numberPad)
        XCTAssertEqual(sut.departTextField.placeholder, R.string.departPlaceholder)
    }

    func testReturnTextField() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertEqual(sut.returnTextField.keyboardType, .numberPad)
        XCTAssertEqual(sut.returnTextField.placeholder, R.string.returnPlaceholder)
    }

    func testNumberOfPassengersTextField() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertEqual(sut.numberOfPassengersTextField.keyboardType, .numberPad)
        XCTAssertEqual(sut.numberOfPassengersTextField.placeholder, R.string.passengersPlaceholder)
    }

    func testSearchTicketsButton() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertEqual(sut.searchTicketsButton.title(for: .normal), R.string.btnSearchTicketsTitle)
        XCTAssertEqual(sut.searchTicketsButton.backgroundColor, R.color.c_26_188_156)
    }

    func testButtonShouldBeHideWhenLoadView() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertFalse(sut.searchTicketsButton.isEnabled)
    }

    func testButtonShouldHaveATargetWhenLoadView() {
        // When
        let sut = SearchView()

        // Then
        XCTAssertTrue(sut.searchTicketsButton.allTargets.count == 1)
    }

    func testFromTextFieldDidEndEditingShouldCallDelegate() {
        // Given
        let delegateSpy = SearchViewDelegateSpy()
        let sut = SearchView()
        sut.delegate = delegateSpy

        // When
        sut.fromTextField.delegate?.textFieldDidEndEditing!(sut.fromTextField)

        // Then
        XCTAssertTrue(delegateSpy.didUpdateFromCalled)
    }

    func testToTextFieldDidEndEditingShouldCallDelegate() {
        // Given
        let delegateSpy = SearchViewDelegateSpy()
        let sut = SearchView()
        sut.delegate = delegateSpy

        // When
        sut.toTextField.delegate?.textFieldDidEndEditing!(sut.toTextField)

        // Then
        XCTAssertTrue(delegateSpy.didUpdateToCalled)
    }

    func testDepartTextFieldDidEndEditingShouldCallDelegate() {
        // Given
        let delegateSpy = SearchViewDelegateSpy()
        let sut = SearchView()
        sut.delegate = delegateSpy

        // When
        sut.departTextField.delegate?.textFieldDidEndEditing!(sut.departTextField)

        // Then
        XCTAssertTrue(delegateSpy.didUpdateDepartCalled)
    }

    func testReturnTextFieldDidEndEditingShouldCallDelegate() {
        // Given
        let delegateSpy = SearchViewDelegateSpy()
        let sut = SearchView()
        sut.delegate = delegateSpy

        // When
        sut.returnTextField.delegate?.textFieldDidEndEditing!(sut.returnTextField)

        // Then
        XCTAssertTrue(delegateSpy.didUpdateReturnCalled)
    }

    func testNumberOfPassengeresTextFieldDidEndEditingShouldCallDelegate() {
        // Given
        let delegateSpy = SearchViewDelegateSpy()
        let sut = SearchView()
        sut.delegate = delegateSpy

        // When
        sut.numberOfPassengersTextField.delegate?.textFieldDidEndEditing!(sut.numberOfPassengersTextField)

        // Then
        XCTAssertTrue(delegateSpy.didUpdateNumberOfPassengersCalled)
    }

    func testDidTapButtonShouldCallDelegate() {
        // Given
        let delegateSpy = SearchViewDelegateSpy()
        let sut = SearchView()
        sut.delegate = delegateSpy

        // When
        sut.didTapSearchTicketsButton(button: UIButton())

        // Then
        XCTAssertTrue(delegateSpy.didTapButtonCalled)
    }

    // MARK: Spy
    class SearchViewDelegateSpy: SearchViewDelegate {

        var didUpdateFromCalled = false
        var didUpdateToCalled = false
        var didUpdateDepartCalled = false
        var didUpdateReturnCalled = false
        var didUpdateNumberOfPassengersCalled = false
        var didTapButtonCalled = false

        func searchView(view: SearchView, didUpdateFrom airport: String) {
            didUpdateFromCalled = true
        }

        func searchView(view: SearchView, didUpdateTo airport: String) {
            didUpdateToCalled = true
        }

        func searchView(view: SearchView, didUpdateDepart date: String) {
            didUpdateDepartCalled = true
        }

        func searchView(view: SearchView, didUpdateReturn date: String) {
            didUpdateReturnCalled = true
        }

        func searchView(view: SearchView, didUpdateNumberOfPassengers passengers: String) {
            didUpdateNumberOfPassengersCalled = true
        }

        func searchView(view: SearchView, didTapButton button: UIButton) {
            didTapButtonCalled = true
        }
    }
}
