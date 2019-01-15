import UIKit

class SearchConfigurator {

    // MARK: - Singleton
    static let sharedInstance: SearchConfigurator = SearchConfigurator()

    // MARK: - Configuration
    func configure(viewController: SearchViewController) {

        let presenter = SearchPresenter(output: viewController)
        let interactor = SearchInteractor(output: presenter)
        viewController.output = interactor
    }
}
