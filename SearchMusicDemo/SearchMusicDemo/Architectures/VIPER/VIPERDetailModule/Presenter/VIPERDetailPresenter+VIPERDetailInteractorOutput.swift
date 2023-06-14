
import Foundation
import UIKit
import SafariServices

extension VIPERDetailPresenter: VIPERDetailInteractorOutput {

	func setImage(_ content: UIImage) {
		viperDetailViewControllerInput.setImage(content)
	}

	func setTitle(_ content: String) {
		viperDetailViewControllerInput.setTitle(content)
	}

	func setCollectionNameLabel(_ content: String) {
		viperDetailViewControllerInput.setCollectionNameLabel(content)
	}

	func setReleaseDateLabel(_ content: String) {
		viperDetailViewControllerInput.setReleaseDateLabel(content)
	}

	func setTrackViewURLLabel(_ content: String) {
		viperDetailViewControllerInput.setTrackViewURLLabel(content)
	}

	func presentSafari(with url: URL) {

		let safariVC = SFSafariViewController(url: url)

		guard let viperDetailViewControllerInput = viperDetailViewControllerInput as? UIViewController else { return }

		router.presentSafari(
			safariVC,
			in: viperDetailViewControllerInput
		)

	}

}
