@testable import Vasp
import XCTest

class RTests: XCTestCase {

    // MARK: string
    func testStrings() {
        XCTAssertEqual(R.string.applicationName, "Vasp")
        XCTAssertEqual(R.string.btnSearchTicketsTitle, "Pesquisar passagens")
        XCTAssertEqual(R.string.defaultButtonTitle, "Ok")
        XCTAssertEqual(R.string.fromPlaceholder, "IATA Origem")
        XCTAssertEqual(R.string.toPlaceholder, "IATA Destino")
        XCTAssertEqual(R.string.departPlaceholder, "Data da ida")
        XCTAssertEqual(R.string.returnPlaceholder, "Data da volta")
        XCTAssertEqual(R.string.passengersPlaceholder, "Quantidade de passageiros")
        XCTAssertEqual(R.string.btnBuyTitle, "Comprar %@")
        XCTAssertEqual(R.string.departRoundTitle, "Ida")
        XCTAssertEqual(R.string.returnRoundTitle, "Volta")
        XCTAssertEqual(R.string.flightObs, "Voo direto")
        XCTAssertEqual(R.string.filter, "Filtrar")
        XCTAssertEqual(R.string.sort, "Ordenar")
        XCTAssertEqual(R.string.airlineTitle, "Cia Aérea")
        XCTAssertEqual(R.string.departureTitle, "Partida")
        XCTAssertEqual(R.string.durationTitle, "Duração")
        XCTAssertEqual(R.string.arriveTitle, "Chegada")
        XCTAssertEqual(R.string.cancelButtonTitle, "Cancelar")
    }

    // MARK: color
    func testColors() {
        XCTAssertEqual(R.color.c_26_188_156, UIColor(r: 26, g: 188, b: 156))
        XCTAssertEqual(R.color.c_216_220_222, UIColor(r: 216, g: 220, b: 222))
        XCTAssertEqual(R.color.c_231_233_234, UIColor(r: 231, g: 233, b: 234))
        XCTAssertEqual(R.color.c_135_147_149, UIColor(r: 135, g: 147, b: 149))
        XCTAssertEqual(R.color.c_225_225_225, UIColor(r: 225, g: 225, b: 225))
        XCTAssertEqual(R.color.c_22_167_138, UIColor(r: 22, g: 167, b: 138))
        XCTAssertEqual(R.color.c_123_136_138, UIColor(r: 123, g: 136, b: 138))
    }

    // MARK: font
    func testFonts() {
        XCTAssertEqual(R.font.n12, UIFont.systemFont(ofSize: 12))
        XCTAssertEqual(R.font.b12, UIFont.boldSystemFont(ofSize: 12))
        XCTAssertEqual(R.font.b14, UIFont.boldSystemFont(ofSize: 14))
        XCTAssertEqual(R.font.n14, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(R.font.b16, UIFont.boldSystemFont(ofSize: 16))
    }

    // MARK: images
    func testImages() {
        XCTAssertNotNil(R.image.pin)
        XCTAssertNotNil(R.image.shape)
        XCTAssertNotNil(R.image.filter)
        XCTAssertNotNil(R.image.sort)
    }

    // MARK: url
    func testURLs() {
        XCTAssertEqual(R.url.mobile, URL(string: "http://developer.goibibo.com"))
    }
}
