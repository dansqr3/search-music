
import UIKit

class VIPERAssembly: VIPERAssemblyProtocol {

	func createVIPERMain(router: VIPERRouterProtocol) -> UIViewController {

		let viperMainViewController = VIPERMainViewController()
		let viperMainInteractor = VIPERMainInteractor()

		let viperMainPresenter = VIPERMainPresenter()

		let fetchData = FetchData()

		viperMainViewController.viperMainViewControllerOutput = viperMainPresenter

		viperMainPresenter.viperMainViewControllerInput = viperMainViewController
		viperMainPresenter.viperMainInteractorInput = viperMainInteractor
		viperMainPresenter.router = router

		viperMainInteractor.viperMainInteractorOutput = viperMainPresenter
		viperMainInteractor.fetchData = fetchData

		return viperMainViewController

	}

	func createVIPERDetail(content: VIPERProduct, router: VIPERRouterProtocol) -> UIViewController {

		let viperDetailViewController = VIPERDetailViewController(content: content)
		let viperDetailInteractor = VIPERDetailInteractor()

		let viperDetailPresenter = VIPERDetailPresenter()

		let fetchData = FetchData()

		viperDetailViewController.viperDetailViewControllerOutput = viperDetailPresenter

		viperDetailPresenter.viperDetailViewControllerInput = viperDetailViewController
		viperDetailPresenter.viperDetailInteractorInput = viperDetailInteractor
		viperDetailPresenter.router = router

		viperDetailInteractor.viperDetailInteractorOutput = viperDetailPresenter
		viperDetailInteractor.fetchData = fetchData

		return viperDetailViewController

	}

}
