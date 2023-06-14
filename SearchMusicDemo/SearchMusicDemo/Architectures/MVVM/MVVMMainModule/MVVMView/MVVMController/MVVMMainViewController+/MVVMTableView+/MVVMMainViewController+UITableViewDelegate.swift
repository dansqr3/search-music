
import UIKit

extension MVVMMainViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		mvvmMainViewModel.didSelectRow(at: indexPath)

		mvvmMainView.searchBar.resignFirstResponder()

	}

}
