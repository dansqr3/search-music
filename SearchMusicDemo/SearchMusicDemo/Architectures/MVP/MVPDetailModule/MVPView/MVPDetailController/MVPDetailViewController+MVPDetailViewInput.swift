
import Foundation
import SafariServices

extension MVPDetailViewController: MVPDetailViewInput {

	func configure(_ content: MVPProduct) {

		if let urlString = content.artworkUrl100 {
			fetchData.loadImageFrom(stringURL: urlString) { [unowned self] picture in
				self.mvpDetailView.image.image = picture
			}
		}

		if let artistName = content.artistName {
			if let trackName = content.trackName {
				mvpDetailView.title.text = "\(artistName) - \(trackName)"
			}
		}

		if let collectionName = content.collectionName {
			mvpDetailView.collectionNameLabel.text = "Collection: \(collectionName)"
		}

		if let releaseDate = content.releaseDate {
			mvpDetailView.releaseDateLabel.text = "Release date: \(releaseDate.formate(to: Constants.DateFormat.format1))"
		}

		if let trackViewURL = content.trackViewURL {
			mvpDetailView.trackViewURLLabel.text = "Track source: \(trackViewURL)"
		}

	}

	func makeNotification() {

		NotificationCenter.default.post(
			name: NSNotification.Name(Constants.NotificationName.mainVC),
			object: nil
		)

	}

	func setupDelegate() {
		mvpDetailView.mvpDetailViewControllerDelegate = self
	}

	func presentSafariVC(_ viewController: SFSafariViewController) {
		present(viewController, animated: true)
	}

}
