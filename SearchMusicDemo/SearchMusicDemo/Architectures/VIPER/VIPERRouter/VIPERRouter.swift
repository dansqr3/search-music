
import Foundation
import UIKit
import SafariServices

class VIPERRouter: VIPERRouterProtocol {

	var navigationController: UINavigationController?

	var viperAssembly: VIPERAssemblyProtocol?

	init(navigationController: UINavigationController?, viperAssembly: VIPERAssemblyProtocol?) {
		self.navigationController = navigationController
		self.viperAssembly = viperAssembly
	}

	func initialMainViewController() {
		if navigationController != nil {
			guard let mainViewController = viperAssembly?.createVIPERMain(router: self) else { return }
			navigationController?.viewControllers = [mainViewController]
		}
	}

	func pushDetailViewController(content: VIPERProduct) {
		if navigationController != nil {
			guard let detailViewController = viperAssembly?.createVIPERDetail(content: content, router: self) else { return }
			navigationController?.pushViewController(detailViewController, animated: true)
		}
	}

	func presentSafari(_ safariVC: SFSafariViewController, in viewController: UIViewController) {
		viewController.present(safariVC, animated: true)
	}

}
