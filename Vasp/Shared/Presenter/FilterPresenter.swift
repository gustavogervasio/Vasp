import Foundation
import UIKit

protocol FilterPresenter {
    func presentFilter(handler: @escaping (_ result: String?) -> Void)
}

extension FilterPresenter where Self: UIViewController {

    func presentFilter(handler: @escaping (_ result: String?) -> Void) {

        let alertController = UIAlertController(title: R.string.applicationName, message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: R.string.cancelButtonTitle, style: .cancel) { (alert) in

            handler(nil)
        }

        alertController.addAction(cancelAction)

        let filterAction = UIAlertAction(title: R.string.filter, style: .default) { (alert) in

            guard let text = alertController.textFields?.first?.text else { return }
            handler(text)
        }

        alertController.addAction(filterAction)

        alertController.addTextField { (textField) in
            textField.placeholder = R.string.airlineTitle
        }

        present(alertController, animated: true, completion: nil)
    }
}
