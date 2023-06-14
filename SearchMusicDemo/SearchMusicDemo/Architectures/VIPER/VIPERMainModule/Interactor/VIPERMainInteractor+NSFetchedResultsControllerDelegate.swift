
import Foundation
import CoreData

extension VIPERMainInteractor: NSFetchedResultsControllerDelegate {

	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		viperMainInteractorOutput.tableViewBeginUpdates()
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
					viperMainInteractorOutput.controllerInsert(newIndexPath: newIndexPath)
				}

			case .delete:

				if let indexPath = indexPath {
					viperMainInteractorOutput.controllerDelete(indexPath: indexPath)
				}

			case .move:

				if let newIndexPath = newIndexPath {
					viperMainInteractorOutput.controllerInsert(newIndexPath: newIndexPath)
				}

				if let indexPath = indexPath {
					viperMainInteractorOutput.controllerDelete(indexPath: indexPath)
				}

			case .update:
				if let indexPath = indexPath {

					viperMainInteractorOutput.controllerUpdate(indexPath: indexPath)

				}

			default:
				break
		}

	}

	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		viperMainInteractorOutput.tableViewEndUpdates()
	}

}
