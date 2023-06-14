
import Foundation
import SafariServices

class MVPDetailPresenter: MVPDetailViewOutput {

	weak var mvpDetailViewInput: MVPDetailViewInput!

	func labelTappedAction(urlString: String?) {

		guard let link = urlString else { return }

		let myLink = link.dropFirst(14)
		guard let url = URL(string: String(myLink)) else { return }

		let safariVC = SFSafariViewController(url: url)

		presentSafari(safariVC)

	}

	private func presentSafari(_ viewController: SFSafariViewController) {
		mvpDetailViewInput.presentSafariVC(viewController)
	}

}
