
import UIKit

class TabBarController: UITabBarController {

	private let mvcAssembly = MVCAssembly()

	private let mvpNavigationController = UINavigationController()
	private let mvvmNavigationController = UINavigationController()
	private let viperNavigationController = UINavigationController()

	override func viewDidLoad() {
		super.viewDidLoad()

		setupMVPRouter()
		setupMVVMRouter()
		setupVIPERRouter()

		setupTabBar()

	}

	private func setupMVPRouter() {

		let mvpAssembly = MVPAssembly()
		let mvpRouter = MVPRouter(navigationController: mvpNavigationController, mvpAssembly: mvpAssembly)
		mvpRouter.initialMainViewController()

	}

	private func setupMVVMRouter() {

		let mvvmAssembly = MVVMAssembly()
		let mvvmRouter = MVVMRouter(navigationController: mvvmNavigationController, mvvmAssembly: mvvmAssembly)
		mvvmRouter.initialMainViewController()

	}

	private func setupVIPERRouter() {

		let viperAssembly = VIPERAssembly()
		let viperRouter = VIPERRouter(navigationController: viperNavigationController, viperAssembly: viperAssembly)
		viperRouter.initialMainViewController()

	}

	private func setupTabBar() {

		let mvcVC = mvcAssembly.createMVCMain()

		viewControllers = [
			createVC(
				viewController: mvcVC,
				title: Constants.TabBar.Title.Short.mvc,
				image: Constants.TabBar.Image.mvc
			),
			createVC(
				viewController: mvpNavigationController,
				title: Constants.TabBar.Title.Short.mvp,
				image: Constants.TabBar.Image.mvp
			),
			createVC(
				viewController: mvvmNavigationController,
				title: Constants.TabBar.Title.Short.mvvm,
				image: Constants.TabBar.Image.mvvm
			),
			createVC(
				viewController: viperNavigationController,
				title: Constants.TabBar.Title.Short.viper,
				image: Constants.TabBar.Image.viper
			),
		]

	}

	private func createVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
		viewController.tabBarItem.title = title
		viewController.tabBarItem.image = image
		return viewController
	}

}
