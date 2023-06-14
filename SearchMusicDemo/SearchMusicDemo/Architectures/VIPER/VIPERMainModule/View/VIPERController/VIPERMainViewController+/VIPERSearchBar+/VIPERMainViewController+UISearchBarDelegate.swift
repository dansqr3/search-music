
import UIKit

extension VIPERMainViewController: UISearchBarDelegate {

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

		viperMainViewControllerOutput.stopActivityIndicator()

		searchBar.resignFirstResponder()

	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

		searchBar.resignFirstResponder()

		viperMainViewControllerOutput.fetchSearchedData(urlString: urlString)

	}

	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

	}

	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

		guard searchText != "" else { return }

		let urlBase = Constants.URLParameters.urlBase
		let search = searchText.replacingOccurrences(of: " ", with: "+")
		let limit = Constants.URLParameters.limit

		let urlString = "\(urlBase)\(search)&limit=\(limit)"
		viperMainViewControllerOutput.setUrlString(urlString)

	}

}
