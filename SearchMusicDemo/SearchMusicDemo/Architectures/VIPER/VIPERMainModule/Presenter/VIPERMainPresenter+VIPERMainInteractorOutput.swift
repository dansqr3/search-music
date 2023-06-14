
import Foundation
import CoreData

extension VIPERMainPresenter: VIPERMainInteractorOutput {

	func setupUrlString(_ urlString: String) {
		viperMainViewControllerInput.setupUrlString(urlString)
	}

	func pushVC(with content: VIPERProduct) {
		router.pushDetailViewController(content: content)
	}

	func setIndexPath(_ indexPath: IndexPath) {
		viperMainViewControllerInput.setIndexPath(indexPath)
	}

	// MARK: - NSFetchedResultsControllerDelegate
	func tableViewBeginUpdates() {
		viperMainViewControllerInput.tableViewBeginUpdates()
	}

	// MARK: - controllerDidChange
	func controllerInsert(newIndexPath: IndexPath) {
		viperMainViewControllerInput.controllerInsert(newIndexPath: newIndexPath)
	}
	func controllerDelete(indexPath: IndexPath) {
		viperMainViewControllerInput.controllerDelete(indexPath: indexPath)
	}
	func controllerMove(indexPath: IndexPath, newIndexPath: IndexPath) {
		viperMainViewControllerInput.controllerMove(indexPath: indexPath, newIndexPath: newIndexPath)
	}
	func controllerUpdate(indexPath: IndexPath) {
		viperMainViewControllerInput.controllerUpdate(indexPath: indexPath)
	}

	func tableViewEndUpdates() {
		viperMainViewControllerInput.tableViewEndUpdates()
	}

	// MARK: - ActivityIndicator

	func startIndicator() {
		viperMainViewControllerInput.startIndicator()
	}

	func stopIndicator() {
		viperMainViewControllerInput.stopIndicator()
	}

}
