@testable import Vasp
import XCTest

class ErrorViewModelTests: XCTestCase {

    func testInit() {
        let viewModel = ErrorViewModel(title: "Title", message: "Message")
        XCTAssertEqual(viewModel.title, "Title")
        XCTAssertEqual(viewModel.message, "Message")
    }

    func testDefaultInit() {
        let viewModel = ErrorViewModel(message: "Message")
        XCTAssertEqual(viewModel.title, R.string.applicationName)
        XCTAssertEqual(viewModel.message, "Message")
    }
}
