
import Foundation
import CoreData

extension VIPERMainViewController: VIPERMainViewControllerInput {

	func setupUrlString(_ urlString: String) {
		self.urlString = urlString
	}

	func setIndexPath(_ indexPath: IndexPath) {
		indexPathForUpdate = indexPath
	}

	func tableViewBeginUpdates() {
		viperMainView.tableView.beginUpdates()
	}

	// MARK: - controllerDidChange
	func controllerInsert(newIndexPath: IndexPath) {
			viperMainView.tableView.insertRows(at: [newIndexPath], with: .fade)
	}
	func controllerDelete(indexPath: IndexPath) {
			viperMainView.tableView.deleteRows(at: [indexPath], with: .fade)
	}
	func controllerMove(indexPath: IndexPath, newIndexPath: IndexPath) {
			viperMainView.tableView.insertRows(at: [newIndexPath], with: .fade)
			viperMainView.tableView.deleteRows(at: [indexPath], with: .fade)
	}
	func controllerUpdate(indexPath: IndexPath) {

			guard let cell = viperMainView.tableView.cellForRow(
				at: indexPath
			) as? VIPERMainTableViewCellProtocol else { fatalError("cell error") }

			viperMainViewControllerOutput.cellConfigure(cell: cell, at: indexPath)

			viperMainViewControllerOutput.stopActivityIndicator()

	}

	func tableViewEndUpdates() {
		viperMainView.tableView.endUpdates()
	}

	// MARK: - ActivityIndicator

	func startIndicator() {
		switchActivityIndicator(sender: true)
	}

	func stopIndicator() {
		switchActivityIndicator(sender: false)
	}

}
