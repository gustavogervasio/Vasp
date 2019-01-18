import Foundation
import UIKit

protocol ErrorPresenter {
    func presentError(viewModel: ErrorViewModel)
}

extension ErrorPresenter where Self: UIViewController {

    func presentError(viewModel: ErrorViewModel) {

        let alertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: R.string.defaultButtonTitle, style: .cancel)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}
