import UIKit

class ResultTableViewCell: BaseTableViewCell {

    private let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()

    var departRoundView: ResultView = {
        let view = ResultView()
        return view
    }()

    private let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.c_135_147_149
        return view
    }()

    var returnRoundView: ResultView = {
        let view = ResultView()
        return view
    }()

    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.c_135_147_149
        return view
    }()

    let buyButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = R.color.c_22_167_138
        btn.layer.cornerRadius = 5
        return btn
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        contentView.backgroundColor = UIColor.groupTableViewBackground

        contentView.addSubview(centerView)
        centerView.addSubview(departRoundView)
        centerView.addSubview(topSeparatorView)
        centerView.addSubview(returnRoundView)
        centerView.addSubview(bottomSeparatorView)
        centerView.addSubview(buyButton)

        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // # MARK: Private Methods
    private func setupConstraints() {

        centerView.anchor (
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            bottom: contentView.bottomAnchor,
            right: contentView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )

        departRoundView.anchor (
            top: centerView.topAnchor,
            left: centerView.leftAnchor,
            bottom: nil,
            right: centerView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )

        topSeparatorView.anchor (
            top: departRoundView.bottomAnchor,
            left: centerView.leftAnchor,
            bottom: nil,
            right: centerView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0.6,
            enableInsets: false
        )

        returnRoundView.anchor (
            top: topSeparatorView.bottomAnchor,
            left: centerView.leftAnchor,
            bottom: nil,
            right: centerView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )

        bottomSeparatorView.anchor (
            top: returnRoundView.bottomAnchor,
            left: centerView.leftAnchor,
            bottom: nil,
            right: centerView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0.6,
            enableInsets: false
        )

        buyButton.anchor (
            top: bottomSeparatorView.bottomAnchor,
            left: centerView.leftAnchor,
            bottom: centerView.bottomAnchor,
            right: centerView.rightAnchor,
            paddingTop: 20,
            paddingLeft: 10,
            paddingBottom: 20,
            paddingRight: 10,
            width: 0,
            height: 54,
            enableInsets: false
        )
    }

    // MARK: Public Methods
    func bindView(result: ResultViewModel) {

        departRoundView.bindView(
            round: R.string.departRoundTitle,
            date: result.round1.date,
            airlineTitle: result.round1.airlineCompany,
            airlineText: result.round1.airlineNumber,
            departureHour: result.round1.hour,
            departureAirport: result.round1.fromAirport,
            durationTitle: result.round1.duration,
            durationText: R.string.flightObs,
            arriveHour: result.round1.hour,
            arriveAirport: result.round1.toAirport
        )

        returnRoundView.bindView(
            round: R.string.returnRoundTitle,
            date: result.round2.date,
            airlineTitle: result.round2.airlineCompany,
            airlineText: result.round2.airlineNumber,
            departureHour: result.round2.hour,
            departureAirport: result.round2.fromAirport,
            durationTitle: result.round2.duration,
            durationText: R.string.flightObs,
            arriveHour: result.round2.hour,
            arriveAirport: result.round2.toAirport
        )

        buyButton.setTitle(String(format: R.string.btnBuyTitle, result.price), for: .normal)
    }
}


extension ResultTableViewCell: TableViewCellProtocol {

    static var identifier: String = "resultTableViewCell"
}
