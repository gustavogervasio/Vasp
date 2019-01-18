import Foundation
import UIKit

struct R {

    struct string {
        static let applicationName = "Vasp"
        static let btnSearchTicketsTitle = "Pesquisar passagens"
        static let defaultButtonTitle = "Ok"
        static let fromPlaceholder = "IATA Origem"
        static let toPlaceholder = "IATA Destino"
        static let departPlaceholder = "Data da ida"
        static let returnPlaceholder = "Data da volta"
        static let passengersPlaceholder = "Quantidade de passageiros"
        static let btnBuyTitle = "Comprar %@"
        static let departRoundTitle = "Ida"
        static let returnRoundTitle = "Volta"
        static let flightObs = "Voo direto"
        static let resultViewControllerTitle = "Pesquisar passagem"
        static let filter = "Filtrar"
        static let sort = "Ordenar"
        static let airlineTitle = "Cia Aérea"
        static let departureTitle = "Partida"
        static let durationTitle = "Duração"
        static let arriveTitle = "Chegada"
        static let cancelButtonTitle = "Cancelar"
    }

    struct color {
        static let c_26_188_156 = UIColor(r: 26, g: 188, b: 156)
        static let c_216_220_222 = UIColor(r: 216, g: 220, b: 222)
        static let c_231_233_234 = UIColor(r: 231, g: 233, b: 234)
        static let c_135_147_149 = UIColor(r: 135, g: 147, b: 149)
        static let c_225_225_225 = UIColor(r: 225, g: 225, b: 225)
        static let c_22_167_138 = UIColor(r: 22, g: 167, b: 138)
        static let c_123_136_138 = UIColor(r: 123, g: 136, b: 138)
    }

    struct font {
        static let n12 = UIFont.systemFont(ofSize: 12)
        static let b12 = UIFont.boldSystemFont(ofSize: 12)
        static let b14 = UIFont.boldSystemFont(ofSize: 14)
        static let n14 = UIFont.systemFont(ofSize: 14)
        static let b16 = UIFont.boldSystemFont(ofSize: 16)
    }

    struct image {
        static let pin = UIImage(named: "pin")
        static let shape = UIImage(named: "shape")
        static let filter = UIImage(named: "filtro")
        static let sort = UIImage(named: "ordenar")
    }

    struct url {
        static let mobile = URL(string: "http://developer.goibibo.com")!
    }
}
