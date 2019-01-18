import UIKit

class TableViewController: UITableViewController {

    // # MARK Init
    init(title: String) {
        super.init(style: .plain)
        self.title = title
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
