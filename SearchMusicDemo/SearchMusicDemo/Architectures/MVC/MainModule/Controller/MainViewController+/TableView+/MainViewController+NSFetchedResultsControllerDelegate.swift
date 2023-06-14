
import Foundation
import CoreData

extension MainViewController: NSFetchedResultsControllerDelegate {

	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		mainView.tableView.beginUpdates()
	}

	func controller(
		_ controller: NSFetchedResultsController<NSFetchRequestResult>,
		didChange anObject: Any,
		at indexPath: IndexPath?,
		for type: NSFetchedResultsChangeType,
		newIndexPath: IndexPath?
	) {
		switch type {
			case .insert:
				if let newIndexPath = newIndexPath {
					mainView.tableView.insertRows(at: [newIndexPath], with: .fade)
				}
			case .delete:
				if let indexPath = indexPath {
					mainView.tableView.deleteRows(at: [indexPath], with: .fade)
				}
			case .move:
				if let newIndexPath = newIndexPath {
					mainView.tableView.insertRows(at: [newIndexPath], with: .fade)
				}
				if let indexPath = indexPath {
					mainView.tableView.deleteRows(at: [indexPath], with: .fade)
				}
			case .update:
				if let indexPath = indexPath {

					guard let cell = mainView.tableView.cellForRow(
						at: indexPath
					) as? MainTableViewCell else { fatalError("cell error") }
					guard let model = fetchResultController.object(at: indexPath) as? MVCProduct else { fatalError("model error") }

					cell.configure(model)

				}

			default:
				break
		}
	}

	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		mainView.tableView.endUpdates()
	}
}
