import UIKit

protocol ResultFooterViewDelegate: class {
    func searchView(view: ResultFooterView, didTapFilterButton button: UIButton)
    func searchView(view: ResultFooterView, didTapSortButton button: UIButton)
}

class ResultFooterView: BaseView {

    weak var delegate: ResultFooterViewDelegate?

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()

    let filterButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(R.color.c_123_136_138, for: .normal)
        btn.setTitle(R.string.filter.uppercased(), for: .normal)
        btn.setImage(R.image.filter, for: .normal)
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = R.color.c_216_220_222.cgColor
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return btn
    }()

    let sortButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(R.color.c_123_136_138, for: .normal)
        btn.setTitle(R.string.sort.uppercased(), for: .normal)
        btn.setImage(R.image.sort, for: .normal)
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = R.color.c_216_220_222.cgColor
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return btn
    }()

    override func setupView() {
        backgroundColor = .white

        // Add views
        addSubview(stackView)
        stackView.addArrangedSubview(filterButton)
        stackView.addArrangedSubview(sortButton)

        // Set target
        filterButton.addTarget(self, action: #selector(didTapFilterButton(button:)), for: .touchUpInside)
        sortButton.addTarget(self, action: #selector(didTapSortButton(button:)), for: .touchUpInside)
    }

    override func setupConstraints() {

        stackView.anchor (
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingTop: 0,
            paddingLeft: 0,
            paddingBottom: 0,
            paddingRight: 0,
            width: 0,
            height: 0,
            enableInsets: false
        )
    }

    // MARK: Private Methods (Target Buttons)
    @objc func didTapFilterButton(button: UIButton) {
        delegate?.searchView(view: self, didTapFilterButton: button)
    }

    @objc func didTapSortButton(button: UIButton) {
        delegate?.searchView(view: self, didTapSortButton: button)
    }
}
