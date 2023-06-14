
import Foundation

protocol MVVMMainViewModelProtocol {

	var productsSignal: Dynamic<[[MVVMProduct]]> { get }
	var openProductSignal: Dynamic<MVVMProduct?> { get }
	var activityIndicatorSignal: Dynamic<Bool> { get }
	var urlStringSignal: Dynamic<String> { get }
	var indexPathForUpdateSignal: Dynamic<IndexPath> { get }

	func updateDataSource()

	// MARK: - UITableViewDataSource
	var numberOfSections: Int { get }

	func numberOfRowsInSection(section: Int) -> Int

	func cellConfigure(cell: MVVMMainTableViewCellProtocol, at indexPath: IndexPath)

	// MARK: - UITableViewDelegate
	func didSelectRow(at indexPath: IndexPath)

	// MARK: - FetchData
	func fetchSearchedData(urlString: String)

}
