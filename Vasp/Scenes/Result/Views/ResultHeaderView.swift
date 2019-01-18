import UIKit

class ResultHeaderView: BaseView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.spacing = 10
        return view
    }()

    let airlineLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n14
        lbl.textColor = .white
        lbl.text = R.string.airlineTitle
        return lbl
    }()

    let departureTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n14
        lbl.textColor = .white
        lbl.text = R.string.departureTitle
        return lbl
    }()

    let durationTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n14
        lbl.textColor = .white
        lbl.text = R.string.durationTitle
        return lbl
    }()

    let arriveTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n14
        lbl.textColor = .white
        lbl.text =  R.string.arriveTitle
        return lbl
    }()

    override func setupView() {
        backgroundColor = R.color.c_135_147_149

        // Add views
        addSubview(stackView)
        stackView.addArrangedSubview(airlineLabel)
        stackView.addArrangedSubview(departureTitle)
        stackView.addArrangedSubview(durationTitle)
        stackView.addArrangedSubview(arriveTitle)
    }

    override func setupConstraints() {

        stackView.anchor (
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingTop: 0,
            paddingLeft: 20,
            paddingBottom: 0,
            paddingRight: 20,
            width: 0,
            height: 0,
            enableInsets: false
        )
    }
}
