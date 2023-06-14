
import Foundation
import SafariServices

extension DetailViewController: DetailViewControllerDelegate {

	func labelTappedAction() {

		guard let link = detailView.trackViewURLLabel.text else { return }

		let myLink = link.dropFirst(14)
		guard let url = URL(string: String(myLink)) else { return }

		let safariVC = SFSafariViewController(url: url)
		present(safariVC, animated: true)

	}

}
