@testable import Vasp
import XCTest

class AppearanceTests: XCTestCase {

    func testWindowAppearance() {
        XCTAssertEqual(UIWindow.appearance().tintColor, R.color.c_26_188_156)
    }

    func testNavigationBarAppearance() {
        XCTAssertEqual(UINavigationBar.appearance().prefersLargeTitles, true)
        XCTAssertEqual(UINavigationBar.appearance().barTintColor, R.color.c_26_188_156)
        XCTAssertEqual(UINavigationBar.appearance().isTranslucent, false)
        XCTAssertEqual(UINavigationBar.appearance().tintColor, .white)
    }
}

