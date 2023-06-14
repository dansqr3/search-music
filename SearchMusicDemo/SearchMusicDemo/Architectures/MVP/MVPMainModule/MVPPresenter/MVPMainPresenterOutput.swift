
import Foundation
import CoreData

protocol MVPMainPresenterOutput: AnyObject {

	func startActivityIndicator()

	func stopActivityIndicator()

	// MARK: - NSFetchedResultsControllerDelegate
	func tableViewBeginUpdates()

	func controllerDidChange(
		_ controller: NSFetchedResultsController<NSFetchRequestResult>,
		at indexPath: IndexPath?,
		for type: NSFetchedResultsChangeType,
		newIndexPath: IndexPath?)

	func tableViewEndUpdates()

	func fetchSearchedData()

	func setIndexPath(_ indexPath: IndexPath)

}
