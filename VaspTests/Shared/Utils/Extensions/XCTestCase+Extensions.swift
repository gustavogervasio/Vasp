import Foundation
import UIKit
import XCTest

extension XCTestCase {

    // MARK: Public Methods
    func loadView(window: UIWindow, viewController: UIViewController) {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
}
