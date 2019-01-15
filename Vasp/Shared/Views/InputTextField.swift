import UIKit

class InputTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Methods
    private func setupView() {
        rightView = UIImageView(image: R.image.pin)
        rightViewMode = .always

        font = R.font.n14
        textColor = R.color.c_135_147_149
        backgroundColor = .white

        layer.cornerRadius = 5
        layer.borderColor = R.color.c_216_220_222.cgColor
        layer.borderWidth = 1
        layer.applySketchShadow(
            color: R.color.c_231_233_234,
            alpha: 0.5,
            x: 2,
            y: 3,
            blur: 0,
            spread: 0
        )
    }
}
