
import UIKit

class MVPAssembly: MVPAssemblyProtocol {

	func createMVPMain(router: MVPRouterProtocol) -> UIViewController {

		let fetchData = FetchData()
		let mvpMainViewController = MVPMainViewController()

		let presenter = MVPMainPresenter()

		mvpMainViewController.mvpPresenter = presenter

		presenter.mvpMainPresenterOutput = mvpMainViewController
		presenter.fetchData = fetchData
		presenter.router = router

		return mvpMainViewController
	}

	func createMVPDetail(content: MVPProduct, router: MVPRouterProtocol) -> UIViewController {

		let view = MVPDetailViewController(content: content)

		let presenter = MVPDetailPresenter()

		presenter.mvpDetailViewInput = view

		view.mvpDetailPresenter = presenter

		return view
	}

}
