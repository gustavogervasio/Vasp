import UIKit

protocol SearchViewControllerInput: SearchPresenterOutput {}

protocol SearchViewControllerOutput {
    func didUpdateFrom(airport: String)
    func didUpdateTo(airport: String)
    func didUpdateDepart(date: String)
    func didUpdateReturn(date: String)
    func didUpdateNumberOfPassengers(passengers: String)
    func didTapSearchButton()
}

protocol SearchViewControllerDelegate: class {
    func searchViewController(controller: SearchViewController, didTapToSearch search: SearchModel)
}

class SearchViewController: UIViewController, ErrorPresenter {

    var output: SearchViewControllerOutput?
    weak var delegate: SearchViewControllerDelegate?

    internal let searchView: SearchView = {
        let view = SearchView()
        return view
    }()

    // MARK: - Initializers
    init(configurator: SearchConfigurator = SearchConfigurator.sharedInstance) {
        super.init(nibName: nil, bundle: nil)
        self.title = R.string.applicationName
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
        searchView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - SearchPresenterOutput
extension SearchViewController: SearchViewControllerInput {

    // MARK: - Display logic
    func displayButton() {
        searchView.setEnabled(enabled: true)
    }

    func hideButton() {
        searchView.setEnabled(enabled: false)
    }

    func displayResult(search: SearchModel) {
        delegate?.searchViewController(controller: self, didTapToSearch: search)
    }
}

extension SearchViewController: SearchViewDelegate {

    func searchView(view: SearchView, didUpdateFrom airport: String) {
        output?.didUpdateFrom(airport: airport)
    }

    func searchView(view: SearchView, didUpdateTo airport: String) {
        output?.didUpdateTo(airport: airport)
    }

    func searchView(view: SearchView, didUpdateDepart date: String) {
        output?.didUpdateDepart(date: date)
    }

    func searchView(view: SearchView, didUpdateReturn date: String) {
        output?.didUpdateReturn(date: date)
    }

    func searchView(view: SearchView, didUpdateNumberOfPassengers passengers: String) {
        output?.didUpdateNumberOfPassengers(passengers: passengers)
    }

    func searchView(view: SearchView, didTapButton button: UIButton) {
        output?.didTapSearchButton()
    }
}
