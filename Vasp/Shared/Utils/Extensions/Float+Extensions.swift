import Foundation

extension Float {

    func currency() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        if let format = formatter.string(from: NSNumber(value: self as Float)) {
            return format
        }
        return ""
    }
}
