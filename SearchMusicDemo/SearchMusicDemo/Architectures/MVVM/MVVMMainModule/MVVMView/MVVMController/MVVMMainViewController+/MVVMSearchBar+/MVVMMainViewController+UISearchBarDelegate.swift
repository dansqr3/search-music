
import UIKit

extension MVVMMainViewController: UISearchBarDelegate {

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

		mvvmMainViewModel.activityIndicatorSignal.value = true
		searchBar.resignFirstResponder()

	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

		searchBar.resignFirstResponder()

		mvvmMainViewModel.fetchSearchedData(urlString: urlString)

	}

	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

	}

	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

		guard searchText != "" else { return }

		let urlBase = Constants.URLParameters.urlBase
		let search = searchText.replacingOccurrences(of: " ", with: "+")
		let limit = Constants.URLParameters.limit

		let urlString = "\(urlBase)\(search)&limit=\(limit)"
		mvvmMainViewModel.urlStringSignal.value = urlString

	}

}
