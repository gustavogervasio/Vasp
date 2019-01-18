import UIKit

protocol TableViewCellProtocol {
    static var identifier: String { get set }
}

class BaseTableViewCell: UITableViewCell {

    // # MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
