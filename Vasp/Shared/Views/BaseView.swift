import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public Methods (Positionable)
    func setupView() {
        fatalError("must be override")
    }

    func setupConstraints() {
        fatalError("must be override")
    }
}
