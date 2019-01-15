import UIKit

class ResultConfigurator {

    // MARK: - Singleton
    static let sharedInstance: ResultConfigurator = ResultConfigurator()

    // MARK: - Configuration
    func configure(viewController: ResultViewController) {

        let presenter = ResultPresenter(output: viewController)
        let interactor = ResultInteractor(output: presenter)
        viewController.output = interactor
    }
}
