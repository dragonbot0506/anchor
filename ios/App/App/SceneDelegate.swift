import UIKit
import Capacitor

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)
        let bridge = CAPBridgeViewController()
        window?.rootViewController = bridge
        window?.makeKeyAndVisible()

        // Match the launch screen and the page in both appearances so nothing flashes before first paint.
        bridge.loadViewIfNeeded()
        let launch = UIColor(named: "LaunchBackground")
        bridge.view.backgroundColor = launch
        bridge.webView?.backgroundColor = launch
        bridge.webView?.scrollView.backgroundColor = launch

        SceneDelegateProxy.shared.scene(scene, willConnectTo: session, options: connectionOptions)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        SceneDelegateProxy.shared.scene(scene, openURLContexts: URLContexts)
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        SceneDelegateProxy.shared.scene(scene, continue: userActivity)
    }
}
