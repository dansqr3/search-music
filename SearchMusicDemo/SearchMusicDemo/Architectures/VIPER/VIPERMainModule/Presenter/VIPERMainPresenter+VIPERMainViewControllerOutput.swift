
import Foundation

extension VIPERMainPresenter: VIPERMainViewControllerOutput {

	func setUrlString(_ urlString: String) {
		viperMainInteractorInput.setUrlString(urlString)
	}

	// MARK: - TableViewDataSource
	var numberOfSections: Int {
		viperMainInteractorInput.numberOfSections
	}

	func numberOfRowsInSection(section: Int) -> Int {

		let numberOfRows = viperMainInteractorInput.numberOfRowsInSection(section: section)
		return numberOfRows

	}

	func cellConfigure(cell: VIPERMainTableViewCellProtocol, at indexPath: IndexPath) {
		viperMainInteractorInput.cellConfigure(cell: cell, at: indexPath)
	}

	// MARK: - UITableViewDelegate
	func didSelectRow(at indexPath: IndexPath) {
		viperMainInteractorInput.didSelectRow(at: indexPath)
	}

	// MARK: - Activity Indicator
	func stopActivityIndicator() {
		viperMainViewControllerInput.stopIndicator()
	}

	func startActivityIndicator() {
		viperMainViewControllerInput.startIndicator()
	}

	// MARK: - FetchData
	func fetchSearchedData(urlString: String) {

		viperMainInteractorInput.deleteAllObjects()

		viperMainInteractorInput.startIndicator()

		viperMainInteractorInput.makeFetch(urlString: urlString)

	}

}
