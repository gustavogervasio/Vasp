import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //Init window
        window = UIWindow(frame: UIScreen.main.bounds)

        //Appearance
        Appearance.install()

        //Init app coordinator
        coordinator = AppCoordinator(window: window)
        coordinator?.start()

        return true
    }
}

