
import Foundation
import SafariServices

extension MVVMDetailViewController: MVVMDetailViewControllerDelegate {

	func labelTappedAction(urlString: String?) {

		presentSafari(urlString: urlString)

	}

	private func presentSafari(urlString: String?) {

		guard let link = urlString else { return }

		let myLink = link.dropFirst(14)
		let stringLink: String = String(myLink)

		guard let url = URL(string: stringLink) else { return }

		let safariVC = SFSafariViewController(url: url)

		present(safariVC, animated: true)

	}

}
