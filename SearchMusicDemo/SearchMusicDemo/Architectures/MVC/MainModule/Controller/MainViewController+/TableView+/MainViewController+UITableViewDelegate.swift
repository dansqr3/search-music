
import UIKit

extension MainViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		guard let content = fetchResultController.object(at: indexPath) as? MVCProduct else { return }

		updateViewsCount(content)

		indexPathForUpdate = indexPath

		let assembly = MVCAssembly()
		navigationController?.pushViewController(assembly.createMVCDetail(content: content), animated: true)

		mainView.searchBar.resignFirstResponder()

	}

	private func updateViewsCount(_ content: MVCProduct) {
		content.viewsCount?.views += 1
		coreDataManager.saveContext()
	}

}
