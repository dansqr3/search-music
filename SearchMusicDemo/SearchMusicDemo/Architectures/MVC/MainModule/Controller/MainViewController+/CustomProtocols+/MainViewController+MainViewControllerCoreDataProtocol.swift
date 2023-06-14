
import Foundation

extension MainViewController: MainViewControllerCoreDataProtocol {

	func setupCoreData() {

		fetchResultController = coreDataManager.fetchResultController(
			entityName: Constants.CoreData.MVC.EntityName.product,
			sortKey: Constants.CoreData.MVC.SortName.releaseDate,
			ascending: false
		)

	}

	func performFetchData() {

		coreDataManager.performFetchData(fetchResultController)

	}

	func setupFetchResultControllerDelegate() {

		fetchResultController.delegate = self

	}

	func deleteAllObjects() {

		coreDataManager.deleteAll(entityName: Constants.CoreData.MVC.EntityName.product)

	}

}
