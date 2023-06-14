
import Foundation

protocol VIPERMainViewControllerOutput {

	func setUrlString(_ urlString: String)

	// MARK: - TableViewDataSource
	var numberOfSections: Int { get }

	func numberOfRowsInSection(section: Int) -> Int

	func cellConfigure(cell: VIPERMainTableViewCellProtocol, at indexPath: IndexPath)

	// MARK: - UITableViewDelegate
	func didSelectRow(at indexPath: IndexPath)

	// MARK: - Activity Indicator
	func stopActivityIndicator()

	func startActivityIndicator()

	// MARK: - FetchData
	func fetchSearchedData(urlString: String)
}
