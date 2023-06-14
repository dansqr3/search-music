
import Foundation
import UIKit
import CoreData

class CoreDataManager: CoreDataManagerProtocol {

	lazy var context: NSManagedObjectContext = {
		persistentContainer.viewContext
	}()

	func fetchResultController(
		entityName: String,
		sortKey: String?,
		ascending: Bool
	) -> NSFetchedResultsController<NSFetchRequestResult> {

		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

		let sortDescriptor = NSSortDescriptor(key: sortKey, ascending: ascending)
		fetchRequest.sortDescriptors = [sortDescriptor]

		let fetchResultController = NSFetchedResultsController(
			fetchRequest: fetchRequest,
			managedObjectContext: context,
			sectionNameKeyPath: nil,
			cacheName: Constants.Cache.name
		)

		return fetchResultController
	}

	func setupDelegate(
		delegate: NSFetchedResultsControllerDelegate,
		fetchResultController: NSFetchedResultsController<NSFetchRequestResult>
	) {
		fetchResultController.delegate = delegate
	}

	func performFetchData(_ fetchResultController: NSFetchedResultsController<NSFetchRequestResult>) {
		do {
			NSFetchedResultsController<NSFetchRequestResult>.deleteCache(withName: Constants.Cache.name)
			try fetchResultController.performFetch()
		} catch let error {
			print("func performFetchData error:", error.localizedDescription)
		}
	}

	func deleteAll(entityName: String) {
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
		let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
		do {
			try context.execute(batchDeleteRequest)
			context.reset()
		} catch let error {
			print("deleteAll error:", error)
		}
	}

	// MARK: - Core Data stack

	lazy var persistentContainer: NSPersistentContainer = {
		/*
		 The persistent container for the application. This implementation
		 creates and returns a container, having loaded the store for the
		 application to it. This property is optional since there are legitimate
		 error conditions that could cause the creation of the store to fail.
		*/

		let container = NSPersistentContainer(name: "CoreData")
		container.loadPersistentStores(completionHandler: { (_, error) in
			if let error = error as NSError? {

				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()

	// MARK: - Core Data Saving support

	func saveContext() {
		let context = persistentContainer.viewContext
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}

	func saveBackgroundContext() {
		let context = persistentContainer.newBackgroundContext()
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}

}
