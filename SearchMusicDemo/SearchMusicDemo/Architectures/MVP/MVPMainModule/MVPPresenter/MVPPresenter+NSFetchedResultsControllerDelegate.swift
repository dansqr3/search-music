
import Foundation
import CoreData

extension MVPMainPresenter: NSFetchedResultsControllerDelegate {

	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		mvpMainPresenterOutput?.tableViewBeginUpdates()
	}

	func controller(
		_ controller: NSFetchedResultsController<NSFetchRequestResult>,
		didChange anObject: Any,
		at indexPath: IndexPath?,
		for type: NSFetchedResultsChangeType,
		newIndexPath: IndexPath?
	) {
		mvpMainPresenterOutput?.controllerDidChange(
			controller,
			at: indexPath,
			for: type,
			newIndexPath: newIndexPath
		)
	}

	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		mvpMainPresenterOutput?.tableViewEndUpdates()
	}

}
