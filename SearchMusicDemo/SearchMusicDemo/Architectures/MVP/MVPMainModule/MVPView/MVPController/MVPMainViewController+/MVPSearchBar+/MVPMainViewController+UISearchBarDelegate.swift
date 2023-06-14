
import UIKit

extension MVPMainViewController: UISearchBarDelegate {

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

		stopActivityIndicator()
		searchBar.resignFirstResponder()

	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

		searchBar.resignFirstResponder()

		fetchSearchedData()

	}

	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

	}

	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

		guard searchText != "" else { return }

		let urlBase = Constants.URLParameters.urlBase
		let search = searchText.replacingOccurrences(of: " ", with: "+")
		let limit = Constants.URLParameters.limit

		urlString = "\(urlBase)\(search)&limit=\(limit)"

	}

}
