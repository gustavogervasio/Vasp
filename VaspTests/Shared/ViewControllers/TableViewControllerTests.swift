@testable import Vasp
import XCTest

class TableViewControllerTests: XCTestCase {

    private var window: UIWindow!
    private var sut: TableViewController!

    override func setUp() {
        window = UIWindow()
        setupTableViewController()
        super.setUp()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Private Methods
    private func setupTableViewController() {
        sut = TableViewController(title: "Title")
    }

    private func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // # MARK: Tests
    func testShouldHaveATitle() {
        XCTAssertEqual(sut.title, "Title")
    }

    func testTableViewShouldBePlain() {
        XCTAssertEqual(sut.tableView.style, .plain)
    }

    func testTableViewSeparatorStyle() {
        XCTAssertEqual(sut.tableView.separatorStyle, .none)
    }

    func testTableViewBackgroundColor() {
        XCTAssertEqual(sut.tableView.backgroundColor, UIColor.groupTableViewBackground)
    }
}
