
import Foundation
import CoreData

protocol VIPERMainInteractorInput {

	func setUrlString(_ urlString: String)

	func setIndexPath(_ indexPath: IndexPath)

	// MARK: - Delegate
	func setupDelegate(_ delegate: NSFetchedResultsControllerDelegate)

	// MARK: - FetchData
	func makeFetch(urlString: String)

	// MARK: - UITableViewDataSource
	var numberOfSections: Int { get }

	func numberOfRowsInSection(section: Int) -> Int

	func cellConfigure(cell: VIPERMainTableViewCellProtocol, at indexPath: IndexPath)

	// MARK: - UITableViewDelegate
	func didSelectRow(at indexPath: IndexPath)

	// MARK: - CoreData
	func deleteAllObjects()

	// MARK: - ActivityIndicator

	func startIndicator()

	func stopIndicator()

}
