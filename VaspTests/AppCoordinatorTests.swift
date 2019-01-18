@testable import Vasp
import XCTest
import UIKit

class AppCoordinatorTests: XCTestCase {

    var sut: AppCoordinator!
    var window: UIWindow!

    override func setUp() {
        setupAppCoordinator()
        super.setUp()
    }
    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Private Methods
    private func setupAppCoordinator() {
        self.window = UIWindow()
        sut = AppCoordinator(window: window)
        sut.start()
    }

    // MARK: Tests
    func testShouldCreateAWindow() {
        XCTAssertNotNil(sut.window)
    }

    func testShouldSetTheKeyWindow() {
        guard let window = sut.window else { return XCTAssertNotNil(sut.window) }
        XCTAssertTrue(window.isKeyWindow)
    }

    func testShouldCreateNavigationViewController() {
        XCTAssertNotNil(sut.window?.rootViewController as? UINavigationController)
    }
}
