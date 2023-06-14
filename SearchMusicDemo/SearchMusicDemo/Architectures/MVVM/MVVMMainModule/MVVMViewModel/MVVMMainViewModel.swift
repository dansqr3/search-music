
import Foundation
import CoreData

class MVVMMainViewModel: NSObject, MVVMMainViewModelProtocol {

	private let coreDataManager: MVVMCoreDataManagerProtocol = CoreDataManager()
	var fetchData: FetchDataProtocol!

	var productsSignal: Dynamic<[[MVVMProduct]]> = Dynamic(value: [])
	var openProductSignal: Dynamic<MVVMProduct?> = Dynamic(value: nil)
	var activityIndicatorSignal: Dynamic<Bool> = Dynamic(value: false)
	var urlStringSignal: Dynamic<String> = Dynamic(value: "")
	var indexPathForUpdateSignal: Dynamic<IndexPath> = Dynamic(value: .init(row: 0, section: 0))

	lazy var fetchResultController = {
		coreDataManager.fetchResultController(
			entityName: Constants.CoreData.MVVM.EntityName.product,
			sortKey: Constants.CoreData.MVVM.SortName.releaseDate,
			ascending: Constants.CoreData.MVVM.Ascending.falseAscending
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

	func updateDataSource() {

		var allProducts: [[MVVMProduct]] = []

		guard let sections = fetchResultController.sections else { return }

		sections.forEach {

			var products: [MVVMProduct] = []

			$0.objects?.forEach { content in

				guard let content = content as? MVVMProduct else { return }
				products.append(content)

			}

			allProducts.append(products)
		}

		productsSignal.value = allProducts

	}

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

	func cellConfigure(cell: MVVMMainTableViewCellProtocol, at indexPath: IndexPath) {
		guard let model = fetchResultController.object(at: indexPath) as? MVVMProduct else { fatalError("model error") }
		cell.configure(model)
	}

	// MARK: - FetchData
	func fetchSearchedData(urlString: String) {

		deleteAllObjects()

		activityIndicatorSignal.value = true

		makeFetch(urlString: urlString)

	}

	// MARK: - TableViewDelegate
	func didSelectRow(at indexPath: IndexPath) {

		guard let content = fetchResultController.object(at: indexPath) as? MVVMProduct else { return }
		updateViewsCount(content)
		openProductSignal.value = content
		indexPathForUpdateSignal.value = indexPath

	}

	// MARK: - Private Methods
	private func performFetchData(
		_ fetchResultController: NSFetchedResultsController<NSFetchRequestResult>
	) {
		coreDataManager.performFetchData(fetchResultController)
	}

	private func updateViewsCount(_ content: MVVMProduct) {
		content.viewsCount?.views += 1
		coreDataManager.saveContext()
	}

	private func deleteAllObjects() {
		coreDataManager.deleteAll(entityName: Constants.CoreData.MVVM.EntityName.product)
	}

	private func makeFetch(urlString: String) {
		fetchData.fetch(urlString: urlString) { [unowned self] content in
			self.coreDataManager.mvvmPrepare(content: content)
		}
	}

}
