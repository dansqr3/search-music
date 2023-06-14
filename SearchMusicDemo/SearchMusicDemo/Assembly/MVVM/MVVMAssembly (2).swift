
import UIKit

class MVVMAssembly: MVVMAssemblyProtocol {

	func createMVVMMain(router: MVVMRouterProtocol) -> UIViewController {

		let fetchData = FetchData()
		let mvvmMainViewController = MVVMMainViewController()

		let mvvmMainViewModel = MVVMMainViewModel()

		mvvmMainViewController.mvvmMainViewModel = mvvmMainViewModel
		mvvmMainViewController.router = router

		mvvmMainViewModel.fetchData = fetchData

		return mvvmMainViewController
	}

	func createMVVMDetail(content: MVVMProduct) -> UIViewController {

		let mvvmDetailViewController = MVVMDetailViewController(content: content)

		let mvvmDetailViewModel = MVVMDetailViewModel()

		mvvmDetailViewController.mvvmDetailViewModel = mvvmDetailViewModel

		return mvvmDetailViewController
	}

}
