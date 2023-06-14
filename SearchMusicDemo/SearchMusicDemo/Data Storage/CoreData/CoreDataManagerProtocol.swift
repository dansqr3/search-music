
import Foundation
import CoreData

protocol CoreDataManagerProtocol {

	func fetchResultController(
		entityName: String,
		sortKey: String?,
		ascending: Bool
	) -> NSFetchedResultsController<NSFetchRequestResult>

	func setupDelegate(
		delegate: NSFetchedResultsControllerDelegate,
		fetchResultController: NSFetchedResultsController<NSFetchRequestResult>
	)

	func performFetchData(_ fetchResultController: NSFetchedResultsController<NSFetchRequestResult>)

	func deleteAll(entityName: String)

	func saveContext()

	func saveBackgroundContext()

}
