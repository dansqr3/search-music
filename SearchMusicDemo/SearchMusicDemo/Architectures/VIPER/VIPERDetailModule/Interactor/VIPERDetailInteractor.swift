
import Foundation

class VIPERDetailInteractor: VIPERDetailInteractorInput {

	weak var viperDetailInteractorOutput: VIPERDetailInteractorOutput!

	var fetchData: FetchDataProtocol!

	func configure(_ content: VIPERProduct) {

		if let urlString = content.artworkUrl100 {
			fetchData.loadImageFrom(stringURL: urlString) { [unowned self] picture in
				guard let picture else { return }
				viperDetailInteractorOutput.setImage(picture)
			}
		}

		if let artistName = content.artistName {
			if let trackName = content.trackName {
				let text = "\(artistName) - \(trackName)"
				viperDetailInteractorOutput.setTitle(text)
			}
		}

		if let collectionName = content.collectionName {
			let text = "Collection: \(collectionName)"
			viperDetailInteractorOutput.setCollectionNameLabel(text)
		}

		if let releaseDate = content.releaseDate {
			let text = "Release date: \(releaseDate.formate(to: Constants.DateFormat.format1))"
			viperDetailInteractorOutput.setReleaseDateLabel(text)
		}

		if let trackViewURL = content.trackViewURL {
			let text = "Track source: \(trackViewURL)"
			viperDetailInteractorOutput.setTrackViewURLLabel(text)
		}

	}

	func labelTappedAction(urlString: String?) {

		guard let link = urlString else { return }

		let myLink = link.dropFirst(14)
		guard let url = URL(string: String(myLink)) else { return }

		viperDetailInteractorOutput.presentSafari(with: url)

	}

}
