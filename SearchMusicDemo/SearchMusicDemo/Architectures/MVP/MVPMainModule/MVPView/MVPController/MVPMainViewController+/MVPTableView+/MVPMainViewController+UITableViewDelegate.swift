
import UIKit

extension MVPMainViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		mvpPresenter.didSelectRow(at: indexPath)

		mvpPresenter.setIndexPath(indexPath)

		mvpMainView.searchBar.resignFirstResponder()

	}

}
