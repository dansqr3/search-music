
import UIKit

class MVCAssembly: MVCAssemblyProtocol {

	func createMVCMain() -> UIViewController {

		let viewController = MainViewController()
		let view = UINavigationController(rootViewController: viewController)

		return view
	}

	func createMVCDetail(content: MVCProduct) -> UIViewController {

		let view = DetailViewController(content: content)

		return view
	}

}
