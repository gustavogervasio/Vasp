import UIKit

protocol SearchViewControllerInput: SearchPresenterOutput {}

protocol SearchViewControllerOutput {
    func doSomething()
}

protocol SearchViewControllerDelegate: class {
    func searchViewController(controller: SearchViewController, didTapToSearch search: SearchModel)
}

class SearchViewController: UIViewController {

    var output: SearchViewControllerOutput?
    weak var delegate: SearchViewControllerDelegate?

    internal let searchView: SearchView = {
        let view = SearchView()
        return view
    }()

    // MARK: - Initializers
    init(configurator: SearchConfigurator = SearchConfigurator.sharedInstance) {
        super.init(nibName: nil, bundle: nil)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - Configurator
    private func configure(configurator: SearchConfigurator = SearchConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }

    // MARK: - View lifecycle
    override func loadView() {
        view = searchView
    }

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

// MARK: - SearchPresenterOutput
extension SearchViewController: SearchViewControllerInput {

    // MARK: - Display logic
    func displaySomething(viewModel: SearchViewModel) {
        // TODO: Update UI
    }
}

