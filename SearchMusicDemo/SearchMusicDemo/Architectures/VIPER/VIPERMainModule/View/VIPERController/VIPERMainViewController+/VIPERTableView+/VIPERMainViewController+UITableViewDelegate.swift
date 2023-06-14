
import UIKit

extension VIPERMainViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		viperMainViewControllerOutput.didSelectRow(at: indexPath)

		viperMainView.searchBar.resignFirstResponder()

	}

}
