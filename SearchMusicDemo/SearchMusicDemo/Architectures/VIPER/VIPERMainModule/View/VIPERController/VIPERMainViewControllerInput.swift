
import Foundation
import CoreData

protocol VIPERMainViewControllerInput: AnyObject {

	func setupUrlString(_ urlString: String)

	func setIndexPath(_ indexPath: IndexPath)

	func tableViewBeginUpdates()

	// MARK: - controllerDidChange
	func controllerInsert(newIndexPath: IndexPath)
	func controllerDelete(indexPath: IndexPath)
	func controllerMove(indexPath: IndexPath, newIndexPath: IndexPath)
	func controllerUpdate(indexPath: IndexPath)

	func tableViewEndUpdates()

	// MARK: - ActivityIndicator

	func startIndicator()

	func stopIndicator()

}
