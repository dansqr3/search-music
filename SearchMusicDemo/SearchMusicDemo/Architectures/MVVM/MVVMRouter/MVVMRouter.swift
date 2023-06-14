
import Foundation
import UIKit

class MVVMRouter: MVVMRouterProtocol {

	var navigationController: UINavigationController?

	var mvvmAssembly: MVVMAssemblyProtocol?

	init(navigationController: UINavigationController?, mvvmAssembly: MVVMAssemblyProtocol?) {
		self.navigationController = navigationController
		self.mvvmAssembly = mvvmAssembly
	}

	func initialMainViewController() {
		if navigationController != nil {
			guard let mainViewController = mvvmAssembly?.createMVVMMain(router: self) else { return }
			navigationController?.viewControllers = [mainViewController]
		}
	}

	func pushDetailViewController(content: MVVMProduct) {
		if navigationController != nil {
			guard let detailViewController = mvvmAssembly?.createMVVMDetail(content: content) else { return }
			navigationController?.pushViewController(detailViewController, animated: true)
		}
	}

}
