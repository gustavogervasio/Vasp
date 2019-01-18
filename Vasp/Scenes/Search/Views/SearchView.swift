import UIKit

protocol SearchViewDelegate: class {
    func searchView(view: SearchView, didUpdateFrom airport: String)
    func searchView(view: SearchView, didUpdateTo airport: String)
    func searchView(view: SearchView, didUpdateDepart date: String)
    func searchView(view: SearchView, didUpdateReturn date: String)
    func searchView(view: SearchView, didUpdateNumberOfPassengers passengers: String)
    func searchView(view: SearchView, didTapButton button: UIButton)
}

class SearchView: BaseView {

    weak var delegate: SearchViewDelegate?

    let fromTextField: InputTextField = {
        let txtField = InputTextField()
        txtField.keyboardType = .asciiCapable
        txtField.autocapitalizationType = .allCharacters
        txtField.placeholder = R.string.fromPlaceholder
        return txtField
    }()

    let toTextField: InputTextField = {
        let txtField = InputTextField()
        txtField.keyboardType = .asciiCapable
        txtField.autocapitalizationType = .allCharacters
        txtField.placeholder = R.string.toPlaceholder
        return txtField
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()

    let departTextField: InputTextField = {
        let txtField = InputTextField()
        txtField.keyboardType = .numberPad
        txtField.placeholder = R.string.departPlaceholder
        return txtField
    }()

    let returnTextField: InputTextField = {
        let txtField = InputTextField()
        txtField.keyboardType = .numberPad
        txtField.placeholder = R.string.returnPlaceholder
        return txtField
    }()

    let numberOfPassengersTextField: InputTextField = {
        let txtField = InputTextField()
        txtField.keyboardType = .numberPad
        txtField.placeholder = R.string.passengersPlaceholder
        return txtField
    }()

    let searchTicketsButton: UIButton = {
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
        stackView.addArrangedSubview(departTextField)
        stackView.addArrangedSubview(returnTextField)
        addSubview(numberOfPassengersTextField)
        addSubview(searchTicketsButton)

        //Set delegate
        fromTextField.delegate = self
        toTextField.delegate = self
        returnTextField.delegate = self
        departTextField.delegate = self
        numberOfPassengersTextField.delegate = self

        //Set button target
        searchTicketsButton.addTarget(self, action: #selector(didTapSearchTicketsButton(button:)), for: .touchUpInside)

        //set defaut value
        setEnabled(enabled: false)
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

        returnTextField.anchor(
            top: nil,
            left: nil,
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

        departTextField.anchor(
            top: nil,
            left: nil,
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

    // MARK: Public Methods
    func setEnabled(enabled: Bool) {
        searchTicketsButton.isEnabled = enabled
        UIView.animate(withDuration: 0.3) {
            self.searchTicketsButton.alpha = enabled ? 1 : 0.5
        }
    }

    // MARK: Private Methods (Target Buttons)
    @objc func didTapSearchTicketsButton(button: UIButton) {
        delegate?.searchView(view: self, didTapButton: button)
    }
}

extension SearchView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if string.count > 0 {

            guard let text = textField.text else { return true }

            switch textField {
            case fromTextField,
                 toTextField:

                return text.count <= 2

            case departTextField,
                 returnTextField:

                if text.count == 2 || text.count == 5 {
                    textField.text = "\(text)/"
                }
                return text.count < 10

            case numberOfPassengersTextField:

                return true

            default:
                return true
            }
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else { return }

        switch textField {
        case fromTextField:
            delegate?.searchView(view: self, didUpdateFrom: text)
        case toTextField:
            delegate?.searchView(view: self, didUpdateTo: text)
        case departTextField:
            delegate?.searchView(view: self, didUpdateDepart: text)
        case returnTextField:
            delegate?.searchView(view: self, didUpdateReturn: text)
        case numberOfPassengersTextField:
            delegate?.searchView(view: self, didUpdateNumberOfPassengers: text)
        default:
            break
        }
    }
}
