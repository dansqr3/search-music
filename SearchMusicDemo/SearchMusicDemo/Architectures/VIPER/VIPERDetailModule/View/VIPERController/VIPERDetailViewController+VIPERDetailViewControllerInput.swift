
import Foundation
import UIKit

extension VIPERDetailViewController: VIPERDetailViewControllerInput {

	func setImage(_ content: UIImage) {
		viperDetailView.image.image = content
	}

	func setTitle(_ content: String) {
		viperDetailView.title.text = content
	}

	func setCollectionNameLabel(_ content: String) {
		viperDetailView.collectionNameLabel.text = content
	}

	func setReleaseDateLabel(_ content: String) {
		viperDetailView.releaseDateLabel.text = content
	}

	func setTrackViewURLLabel(_ content: String) {
		viperDetailView.trackViewURLLabel.text = content
	}

}
