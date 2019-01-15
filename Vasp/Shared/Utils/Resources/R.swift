import Foundation
import UIKit

struct R {

    struct string {
        static let btnSearchTicketsTitle = "Pesquisar passagens"
    }

    struct color {
        static let c_26_188_156 = UIColor(r: 26, g: 188, b: 156)
        static let c_216_220_222 = UIColor(r: 216, g: 220, b: 222)
        static let c_231_233_234 = UIColor(r: 231, g: 233, b: 234)
        static let c_135_147_149 = UIColor(r: 135, g: 147, b: 149)
    }

    struct font {
        static let n12 = UIFont.systemFont(ofSize: 12)
        static let b12 = UIFont.boldSystemFont(ofSize: 12)
        static let b14 = UIFont.boldSystemFont(ofSize: 14)
        static let n14 = UIFont.systemFont(ofSize: 14)
    }

    struct image {
        static let pin = UIImage(named: "pin")
    }

    struct url {
        static let mobile = URL(string: "https://api.github.com")!
    }
}

