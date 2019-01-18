import UIKit

class ResultView: BaseView {

    private let topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.spacing = 10
        return view
    }()

    private let middleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 5
        return view
    }()

    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 5
        return view
    }()

    let roundLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.b16
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let roundImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = R.image.shape
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n12
        lbl.textAlignment = .right
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let airlineTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.b14
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let airlineTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n12
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let departureHourTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.b14
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let departureAirportTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n12
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let durationTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.b14
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let durationTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n12
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let arriveHourTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.b14
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    let arriveAirportTextLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = R.font.n12
        lbl.textColor = R.color.c_135_147_149
        return lbl
    }()

    override func setupView() {
        addSubview(topStackView)
        topStackView.addArrangedSubview(roundLabel)
        topStackView.addArrangedSubview(roundImageView)
        topStackView.addArrangedSubview(dateLabel)

        addSubview(middleStackView)
        middleStackView.addArrangedSubview(airlineTitleLabel)
        middleStackView.addArrangedSubview(departureHourTitleLabel)
        middleStackView.addArrangedSubview(durationTitleLabel)
        middleStackView.addArrangedSubview(arriveHourTitleLabel)

        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(airlineTextLabel)
        bottomStackView.addArrangedSubview(departureAirportTextLabel)
        bottomStackView.addArrangedSubview(durationTextLabel)
        bottomStackView.addArrangedSubview(arriveAirportTextLabel)
    }

    override func setupConstraints() {

        topStackView.anchor (
            top: topAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )

        middleStackView.anchor (
            top: topStackView.bottomAnchor,
            left: leftAnchor,
            bottom: nil,
            right: rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )

        bottomStackView.anchor (
            top: middleStackView.bottomAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )
    }

    // MARK: Public Methods
    func bindView(
        round: String,
        date: String,
        airlineTitle: String,
        airlineText: String,
        departureHour: String,
        departureAirport: String,
        durationTitle: String,
        durationText: String,
        arriveHour: String,
        arriveAirport: String) {

        roundLabel.text = round.uppercased()
        dateLabel.text = date
        airlineTitleLabel.text = airlineTitle.uppercased()
        airlineTextLabel.text = airlineText.uppercased()
        departureHourTitleLabel.text = departureHour
        departureAirportTextLabel.text = departureAirport.uppercased()
        durationTitleLabel.text = durationTitle
        durationTextLabel.text = durationText.uppercased()
        arriveHourTitleLabel.text = arriveHour
        arriveAirportTextLabel.text = arriveAirport.uppercased()
    }
}
