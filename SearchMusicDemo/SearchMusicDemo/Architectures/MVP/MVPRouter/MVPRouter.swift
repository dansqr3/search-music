
import Foundation
import UIKit

class MVPRouter: MVPRouterProtocol {

	var navigationController: UINavigationController?

	var mvpAssembly: MVPAssemblyProtocol?

	init(navigationController: UINavigationController?, mvpAssembly: MVPAssemblyProtocol?) {
		self.navigationController = navigationController
		self.mvpAssembly = mvpAssembly
	}

	func initialMainViewController() {
		if navigationController != nil {
			guard let mainViewController = mvpAssembly?.createMVPMain(router: self) else { return }
			navigationController?.viewControllers = [mainViewController]
		}
	}

	func pushDetailViewController(content: MVPProduct) {
		if navigationController != nil {
			guard let detailViewController = mvpAssembly?.createMVPDetail(content: content, router: self) else { return }
			navigationController?.pushViewController(detailViewController, animated: true)
		}
	}

}
