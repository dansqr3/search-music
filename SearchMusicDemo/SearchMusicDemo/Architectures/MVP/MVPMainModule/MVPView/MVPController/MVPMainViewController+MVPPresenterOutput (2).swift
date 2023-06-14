
import Foundation
import CoreData

extension MVPMainViewController: MVPMainPresenterOutput {

	func setIndexPath(_ indexPath: IndexPath) {
		indexPathForUpdate = indexPath
	}

	// MARK: - ActivityIndicator
	func startActivityIndicator() {
		mvpMainView.indicatorBackgroundView.alpha = 0.7
		mvpMainView.activityIndicator.alpha = 1
		mvpMainView.activityIndicator.startAnimating()
	}

	func stopActivityIndicator() {
		mvpMainView.indicatorBackgroundView.alpha = 0
		mvpMainView.activityIndicator.stopAnimating()
		mvpMainView.activityIndicator.alpha = 0
	}

	// MARK: - NSFetchedResultsControllerDelegate
	func tableViewBeginUpdates() {
		mvpMainView.tableView.beginUpdates()
	}

	func controllerDidChange(
		_ controller: NSFetchedResultsController<NSFetchRequestResult>,
		at indexPath: IndexPath?,
		for type: NSFetchedResultsChangeType,
		newIndexPath: IndexPath?) {

			switch type {
				case .insert:
					if let newIndexPath = newIndexPath {
						mvpMainView.tableView.insertRows(at: [newIndexPath], with: .fade)
					}
				case .delete:
					if let indexPath = indexPath {
						mvpMainView.tableView.deleteRows(at: [indexPath], with: .fade)
					}
				case .move:
					if let newIndexPath = newIndexPath {
						mvpMainView.tableView.insertRows(at: [newIndexPath], with: .fade)
					}
					if let indexPath = indexPath {
						mvpMainView.tableView.deleteRows(at: [indexPath], with: .fade)
					}
				case .update:
					if let indexPath = indexPath {

						guard let cell = mvpMainView.tableView.cellForRow(
							at: indexPath
						) as? MVPMainTableViewCellProtocol else { fatalError("cell error") }

						mvpPresenter.cellConfigure(cell: cell, at: indexPath)

						mvpPresenter.stopIndicator()

					}

				default:
					break
			}

		}

	func tableViewEndUpdates() {
		mvpMainView.tableView.endUpdates()
	}

	// MARK: - FetchData
	func fetchSearchedData() {

		mvpPresenter.deleteAllObjects()

		mvpPresenter.startIndicator()

		mvpPresenter.makeFetch(urlString: urlString)

	}

}
