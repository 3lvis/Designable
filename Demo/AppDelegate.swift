import UIKit
import Pinwheel

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    lazy var data: [PinwheelSection] = {
        return [
            PinwheelSection(title: "DNA", items: [
                PinwheelItem(title: "Font", viewController: PinwheelViewController<PinFont>()),
                PinwheelItem(title: "Color", viewController: PinwheelViewController<PinColor>()),
                PinwheelItem(title: "Spacing", viewController: PinwheelViewController<PinSpacing>()),
            ]),
            PinwheelSection(title: "Components", items: [
                PinwheelItem(title: "BottomSheet", viewController: PinViewControllerBottomSheet()),
                PinwheelItem(title: "Label", viewController: PinwheelViewController<PinLabel>()),
                PinwheelItem(title: "Tweakable", viewController: PinwheelViewController<PinTweakable>(dismissType: .dismissButton)),
            ]),
            PinwheelSection(title: "Cells", items: [
                PinwheelItem(title: "Basic", viewController: PinwheelViewController<PinBasicTableViewCell>()),
                PinwheelItem(title: "Basic Variations", viewController: PinwheelViewController<PinVariationsBasicTableViewCell>()),
            ]),
            PinwheelSection(title: "Reciclable", items: [
                PinwheelItem(title: "Basic", viewController: PinwheelViewController<PinBasicTableView>(containmentOptions: [.bottomSheet])),
            ]),
        ]
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { fatalError("Window not found") }

        // Config.colorProvider = DemoColorProvider()
        // Config.fontProvider = DemoFontProvider()

        let viewController = PinwheelTableViewController(sections: data)
        window.rootViewController = NavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()

        return true
    }
}
