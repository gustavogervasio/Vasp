import UIKit

class SearchView: BaseView {

    private let fromTextField: InputTextField = {
        let txtField = InputTextField()
        return txtField
    }()

    private let toTextField: InputTextField = {
        let txtField = InputTextField()
        return txtField
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()

    private let dateFromTextField: InputTextField = {
        let txtField = InputTextField()
        return txtField
    }()

    private let dateToTextField: InputTextField = {
        let txtField = InputTextField()
        return txtField
    }()

    private let numberOfPassengersTextField: InputTextField = {
        let txtField = InputTextField()
        return txtField
    }()

    private let searchTicketsButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = R.color.c_26_188_156
        btn.setTitle(R.string.btnSearchTicketsTitle, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()

    // MARK: Override Methods
    override func setupView() {
        backgroundColor = .white

        //Add subview
        addSubview(fromTextField)
        addSubview(toTextField)
        addSubview(stackView)
        stackView.addArrangedSubview(dateToTextField)
        stackView.addArrangedSubview(dateFromTextField)
        addSubview(numberOfPassengersTextField)
        addSubview(searchTicketsButton)

        //Set delegate
        fromTextField.delegate = self
        toTextField.delegate = self
        dateToTextField.delegate = self
        dateFromTextField.delegate = self
        numberOfPassengersTextField.delegate = self
    }

    override func setupConstraints() {

        fromTextField.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingBottom: 0,
            paddingRight: 20,
            width: 0,
            height: 54,
            enableInsets: false
        )

        toTextField.anchor(
            top: fromTextField.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingBottom: 0,
            paddingRight: 20,
            width: 0,
            height: 54,
            enableInsets: false
        )

        stackView.anchor(
            top: toTextField.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingBottom: 0,
            paddingRight: 20,
            width: 0,
            height: 0,
            enableInsets: false
        )

        dateToTextField.anchor(
            top: stackView.topAnchor,
            left: stackView.leftAnchor,
            bottom: nil,
            right: nil,
            paddingTop: 0,
            paddingLeft: 0,
            paddingBottom: 0,
            paddingRight: 0,
            width: 0,
            height: 54,
            enableInsets: false
        )

        dateFromTextField.anchor(
            top: stackView.topAnchor,
            left: nil,
            bottom: nil,
            right: stackView.rightAnchor,
            paddingTop: 0,
            paddingLeft: 0,
            paddingBottom: 0,
            paddingRight: 0,
            width: 0,
            height: 54,
            enableInsets: false
        )

        numberOfPassengersTextField.anchor(
            top: stackView.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 20,
            paddingLeft: 20,
            paddingBottom: 0,
            paddingRight: 20,
            width: 0,
            height: 54,
            enableInsets: false
        )

        searchTicketsButton.anchor(
            top: numberOfPassengersTextField.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 40,
            paddingLeft: 20,
            paddingBottom: 0,
            paddingRight: 20,
            width: 0,
            height: 54,
            enableInsets: false
        )

    }
}

extension SearchView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
    }
}
