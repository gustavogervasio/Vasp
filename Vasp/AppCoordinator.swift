import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: NSObject {

    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        super.init()
    }

    // MARK: Public Methods
    func start() {
        guard let window = self.window else { return }

        let searchViewController = SearchViewController()
        searchViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: searchViewController)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    // MARK: Internal Methods
    internal func displayResultViewController(search: SearchModel) {
        guard let navigationController = window?.rootViewController as? UINavigationController else { return }

        let resultViewController = ResultViewController(search: search, title: R.string.resultViewControllerTitle)
        navigationController.pushViewController(resultViewController, animated: true)
    }
}

extension AppCoordinator: SearchViewControllerDelegate {
    func searchViewController(controller: SearchViewController, didTapToSearch search: SearchModel) {

        displayResultViewController(search: search)
    }
}
