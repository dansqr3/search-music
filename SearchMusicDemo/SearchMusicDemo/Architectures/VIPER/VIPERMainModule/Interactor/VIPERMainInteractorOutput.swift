
import Foundation
import CoreData

protocol VIPERMainInteractorOutput: AnyObject {

	func setupUrlString(_ urlString: String)

	func pushVC(with content: VIPERProduct)

	func setIndexPath(_ indexPath: IndexPath)

	// MARK: - NSFetchedResultsControllerDelegate
	func tableViewBeginUpdates()

	// controllerDidChange
	func controllerInsert(newIndexPath: IndexPath)
	func controllerDelete(indexPath: IndexPath)
	func controllerMove(indexPath: IndexPath, newIndexPath: IndexPath)
	func controllerUpdate(indexPath: IndexPath)

	func tableViewEndUpdates()

	// MARK: - ActivityIndicator
	func startActivityIndicator()

	func stopActivityIndicator()

}
