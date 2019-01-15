import UIKit

protocol ResultViewControllerInput: ResultPresenterOutput {

}

protocol ResultViewControllerOutput {
    func doSomething()
}

class ResultViewController: TableViewController {

    var output: ResultViewControllerOutput?
    private let search: SearchModel

    // MARK: - Initializers
    init(search: SearchModel, title: String, configurator: ResultConfigurator = ResultConfigurator.sharedInstance) {
        self.search = search
        super.init(title: title)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configurator
    private func configure(configurator: ResultConfigurator = ResultConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        doSomething()
    }

    // MARK: - Load data
    func doSomething() {
        // TODO: Ask the Interactor to do some work
        output?.doSomething()
    }
}

// MARK: - ResultPresenterOutput
extension ResultViewController: ResultViewControllerInput {

    // MARK: - Display logic
    func displaySomething(viewModel: ResultViewModel) {
        // TODO: Update UI
    }
}

