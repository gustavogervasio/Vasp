import UIKit

protocol ResultViewControllerInput: ResultPresenterOutput {}

protocol ResultViewControllerOutput {
    func fetchSearch(search: SearchModel)
    func sortByPrice()
    func filterByAirline(airline: String)
}

class ResultViewController: TableViewController, ErrorPresenter, FilterPresenter {

    var output: ResultViewControllerOutput?
    private let search: SearchModel

    internal var fetchedResult: [ResultViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private let footerView: ResultFooterView = {
        let view = ResultFooterView()
        return view
    }()

    private let headerView: ResultHeaderView = {
        let view = ResultHeaderView()
        return view
    }()

    // MARK: - Initializers
    init(search: SearchModel, title: String, configurator: ResultConfigurator = ResultConfigurator.sharedInstance) {
        self.search = search
        super.init(title: title)

        configure()
        configureCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configurator
    private func configure(configurator: ResultConfigurator = ResultConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }
    private func configureCell() {

        tableView.register(
            ResultTableViewCell.self,
            forCellReuseIdentifier: ResultTableViewCell.identifier
        )
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        footerView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchSearch()
    }

    // MARK: - Load data
    func fetchSearch() {
        output?.fetchSearch(search: search)
    }

    // MARK: TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResult.count > 0 ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return fetchedResult.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as! ResultTableViewCell

        let result = fetchedResult[indexPath.row]

        cell.bindView(result: result)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        return footerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 55
    }

}

// MARK: - ResultPresenterOutput
extension ResultViewController: ResultViewControllerInput {

    // MARK: - Display logic
    func displayViewModel(viewModel: [ResultViewModel]) {
        fetchedResult = viewModel
    }

    func displayError(viewModel: ErrorViewModel) {
        presentError(viewModel: viewModel)
    }
}

extension ResultViewController: ResultFooterViewDelegate {

    func searchView(view: ResultFooterView, didTapFilterButton button: UIButton) {

        presentFilter { [weak self] (airline) in
            self?.output?.filterByAirline(airline: airline ?? "")
        }
    }

    func searchView(view: ResultFooterView, didTapSortButton button: UIButton) {
        output?.sortByPrice()
    }
}
