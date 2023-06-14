
import Foundation
import CoreData

class VIPERMainInteractor: NSObject, VIPERMainInteractorInput {

	weak var viperMainInteractorOutput: VIPERMainInteractorOutput!

	// MARK: - CoreData, Model
	private let coreDataManager: VIPERCoreDataManagerProtocol = CoreDataManager()

	var fetchData: FetchDataProtocol!

	lazy var fetchResultController = {
		coreDataManager.fetchResultController(
			entityName: Constants.CoreData.VIPER.EntityName.product,
			sortKey: Constants.CoreData.VIPER.SortName.releaseDate,
			ascending: Constants.CoreData.VIPER.Ascending.falseAscending
		)
	}()

	// MARK: - init
	override init() {
		super.init()

		setupDelegate(self)
		performFetchData(fetchResultController)

	}

	// MARK: - Methods
	func setUrlString(_ urlString: String) {
		viperMainInteractorOutput.setupUrlString(urlString)
	}

	func setupDelegate(_ delegate: NSFetchedResultsControllerDelegate) {
		fetchResultController.delegate = delegate
	}

	func setIndexPath(_ indexPath: IndexPath) {
		viperMainInteractorOutput.setIndexPath(indexPath)
	}

	func deleteAllObjects() {
		coreDataManager.deleteAll(entityName: Constants.CoreData.VIPER.EntityName.product)
	}

	// MARK: - TableViewDataSource
	var numberOfSections: Int {
		fetchResultController.sections?.count ?? 0
	}

	func numberOfRowsInSection(section: Int) -> Int {
		if let sections = fetchResultController.sections {
			let numberOfRows = sections[section].numberOfObjects
			return numberOfRows
		} else {
			return 0
		}
	}

	func cellConfigure(cell: VIPERMainTableViewCellProtocol, at indexPath: IndexPath) {
		guard let model = fetchResultController.object(at: indexPath) as? VIPERProduct else { fatalError("model error") }
		cell.configure(model)
	}

	// MARK: - TableViewDelegate
	func didSelectRow(at indexPath: IndexPath) {

		guard let content = fetchResultController.object(at: indexPath) as? VIPERProduct else { return }

		viperMainInteractorOutput.setIndexPath(indexPath)

		updateViewsCount(content)

		pushVC(with: content)

	}

	// MARK: - Network
	func makeFetch(urlString: String) {
		fetchData.fetch(urlString: urlString) { [unowned self] content in
			self.coreDataManager.viperPrepare(content: content)
		}
	}

	// MARK: - ActivityIndicator
	func startIndicator() {
		viperMainInteractorOutput.startActivityIndicator()
	}

	func stopIndicator() {
		viperMainInteractorOutput.stopActivityIndicator()
	}

	// MARK: - Private Methods
	private func performFetchData(
		_ fetchResultController: NSFetchedResultsController<NSFetchRequestResult>
	) {
		coreDataManager.performFetchData(fetchResultController)
	}

	private func updateViewsCount(_ content: VIPERProduct) {
		content.viewsCount?.views += 1
		coreDataManager.saveContext()
	}

	private func pushVC(with content: VIPERProduct) {
		viperMainInteractorOutput.pushVC(with: content)
	}

}
