
import Foundation
import CoreData

class MVPMainPresenter: NSObject, MVPMainPresenterInput {

	weak var mvpMainPresenterOutput: MVPMainPresenterOutput?

	// MARK: - CoreData, Model
	private let coreDataManager: MVPCoreDataManagerProtocol = CoreDataManager()

	var fetchData: FetchDataProtocol!
	var router: MVPRouterProtocol!

	lazy var fetchResultController = {
		coreDataManager.fetchResultController(
			entityName: Constants.CoreData.MVP.EntityName.product,
			sortKey: Constants.CoreData.MVP.SortName.releaseDate,
			ascending: Constants.CoreData.MVP.Ascending.falseAscending
		)
	}()

	// MARK: - init
	override init() {
		super.init()

		setupDelegate(self)
		performFetchData(fetchResultController)

	}

	func setupDelegate(_ delegate: NSFetchedResultsControllerDelegate) {
		fetchResultController.delegate = delegate
	}

	func setIndexPath(_ indexPath: IndexPath) {
		mvpMainPresenterOutput?.setIndexPath(indexPath)
	}

	func deleteAllObjects() {
		coreDataManager.deleteAll(entityName: Constants.CoreData.MVP.EntityName.product)
	}

	// MARK: - TableViewDataSource
	var numberOfSections: Int {
		fetchResultController.sections?.count ?? 0
	}

	func numberOfRowsInSection(section: Int) -> Int {
		if let sections = fetchResultController.sections {
			return sections[section].numberOfObjects
		} else {
			return 0
		}
	}

	func cellConfigure(cell: MVPMainTableViewCellProtocol, at indexPath: IndexPath) {
		guard let model = fetchResultController.object(at: indexPath) as? MVPProduct else { fatalError("model error") }
		cell.configure(model)
	}

	// MARK: - TableViewDelegate
	func didSelectRow(at indexPath: IndexPath) {

		guard let content = fetchResultController.object(at: indexPath) as? MVPProduct else { return }

		updateViewsCount(content)

		pushVC(with: content)

	}

	// MARK: - Network
	func makeFetch(urlString: String) {
		fetchData.fetch(urlString: urlString) { [unowned self] content in
			self.coreDataManager.mvpPrepare(content: content)
		}
	}

	// MARK: - ActivityIndicator
	func startIndicator() {
		mvpMainPresenterOutput?.startActivityIndicator()
	}

	func stopIndicator() {
		mvpMainPresenterOutput?.stopActivityIndicator()
	}

	// MARK: - Private Methods
	private func performFetchData(
		_ fetchResultController: NSFetchedResultsController<NSFetchRequestResult>
	) {
		coreDataManager.performFetchData(fetchResultController)
	}

	private func updateViewsCount(_ content: MVPProduct) {
		content.viewsCount?.views += 1
		coreDataManager.saveContext()
	}

	private func pushVC(with content: MVPProduct) {
		router.pushDetailViewController(content: content)
	}

}
