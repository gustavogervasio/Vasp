@testable import Vasp
import XCTest
import UIKit

class ResultViewControllerTests: XCTestCase {

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
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // Then
        XCTAssertNotNil(sut.output)
    }

    func testInitShouldSetInteractorOutput() {
        // When
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // Then
        XCTAssertNotNil(sut.output as? ResultInteractor)
    }

    func testInitShouldSetPresenterOutput() {
        // When
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // Then
        if let interactor = sut.output as? ResultInteractor {

            XCTAssertNotNil(interactor.output as? ResultPresenter)

        } else {

            XCTFail("should not be nil")
        }
    }

    func testShouldHaveATitle() {
        // Given
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // When
        loadView(window: window, viewController: sut)

        // Then
        XCTAssertEqual(sut.title, "Title")
    }

    func testInitShouldSetTableView() {
        // When
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // Then
        XCTAssertNotNil(sut.tableView)
    }

    func testShouldRegisterResultTableViewCell() {
        // When
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // When
        loadView(window: window, viewController: sut)

        // Then
        XCTAssertNotNil(sut.tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier))
    }

    func testControllerConformsToTableViewDataSource() {
        // When
        let sut = ResultViewController(search: SearchModel(), title: "Title")

        // Then
        XCTAssertNotNil(sut.tableView.dataSource)
    }

    func testViewDidAppearShouldLoadData() {
        // Given
        let sut = ResultViewController(search: SearchModel(), title: "Title")
        let outputSpy = ResultViewControllerOutputSpy()
        sut.output = outputSpy

        // When
        loadView(window: window, viewController: sut)

        // Then
        XCTAssertTrue(outputSpy.fetchSearchCalled)
    }

    func testDidTapSortButtonShouldAskSortByPrice() {
        // Given
        let sut = ResultViewController(search: SearchModel(), title: "Title")
        let outputSpy = ResultViewControllerOutputSpy()
        sut.output = outputSpy
        loadView(window: window, viewController: sut)

        // When
        sut.searchView(view: ResultFooterView(), didTapSortButton: UIButton())

        // Then
        XCTAssertTrue(outputSpy.sortByPriceCalled)
    }

    func testShouldReloadTableViewWhenUpdateFetchedResult() {
        // Given
        let sut = ResultViewController(search: SearchModel(), title: "Title")
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy

        // When
        sut.fetchedResult = []

        // Then
        XCTAssertTrue(tableViewSpy.reloadDataCalled)
    }

    class ResultViewControllerOutputSpy: ResultViewControllerOutput {

        var fetchSearchCalled = false
        var sortByPriceCalled = false
        var filterByAirlineCalled = false

        func fetchSearch(search: SearchModel) {
            fetchSearchCalled = true
        }

        func sortByPrice() {
            sortByPriceCalled = true
        }

        func filterByAirline(airline: String) {
            filterByAirlineCalled = true
        }
    }


    class TableViewSpy: UITableView {

        var reloadDataCalled = false

        override func reloadData() {
            reloadDataCalled = true
        }
    }
}

