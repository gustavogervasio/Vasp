@testable import Vasp
import XCTest
import UIKit

class ResultFooterViewTests: XCTestCase {

    func testInitShouldSetBackgroundColor() {
        // When
        let sut = ResultFooterView()

        // Then
        XCTAssertEqual(sut.backgroundColor, .white)
    }

    func testFilterButton() {
        // When
        let sut = ResultFooterView()

        // Then
        XCTAssertEqual(sut.filterButton.titleColor(for: .normal), R.color.c_123_136_138)
        XCTAssertEqual(sut.filterButton.title(for: .normal), R.string.filter.uppercased())
        XCTAssertEqual(sut.filterButton.image(for: .normal), R.image.filter)
        XCTAssertEqual(sut.filterButton.layer.borderWidth, 0.5)
        XCTAssertEqual(sut.filterButton.layer.borderColor, R.color.c_216_220_222.cgColor)
        XCTAssertEqual(sut.filterButton.allTargets.count, 1)
    }

    func testSortButton() {
        // When
        let sut = ResultFooterView()

        // Then
        XCTAssertEqual(sut.sortButton.titleColor(for: .normal), R.color.c_123_136_138)
        XCTAssertEqual(sut.sortButton.title(for: .normal), R.string.sort.uppercased())
        XCTAssertEqual(sut.sortButton.image(for: .normal), R.image.sort)
        XCTAssertEqual(sut.sortButton.layer.borderWidth, 0.5)
        XCTAssertEqual(sut.sortButton.layer.borderColor, R.color.c_216_220_222.cgColor)
        XCTAssertEqual(sut.sortButton.allTargets.count, 1)
    }

    func testTapFilterButtonShouldCallDelegate() {
        // Given
        let sut = ResultFooterView()
        let delegate = ResultFooterViewDelegateSpy()
        sut.delegate = delegate

        // When
        sut.didTapFilterButton(button: UIButton())

        // Then
        XCTAssertTrue(delegate.didTapFilterButtonCalled)
    }

    func testTapSortButtonShouldCallDelegate() {
        // Given
        let sut = ResultFooterView()
        let delegate = ResultFooterViewDelegateSpy()
        sut.delegate = delegate

        // When
        sut.didTapSortButton(button: UIButton())

        // Then
        XCTAssertTrue(delegate.didTapSortButtonCalled)
    }

    class ResultFooterViewDelegateSpy: ResultFooterViewDelegate {

        var didTapFilterButtonCalled = false
        var didTapSortButtonCalled = false

        func searchView(view: ResultFooterView, didTapFilterButton button: UIButton) {
            didTapFilterButtonCalled = true
        }
        func searchView(view: ResultFooterView, didTapSortButton button: UIButton) {
            didTapSortButtonCalled = true
        }
    }

}
