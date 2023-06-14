
import Foundation

extension CoreDataManager: MVPCoreDataManagerProtocol {

	func createMVPEntity(from music: Music) {

		let product = MVPProduct(context: context)

		product.artistName = music.artistName
		product.trackName = music.trackName
		product.collectionName = music.collectionName
		product.releaseDate = music.releaseDate
		product.artworkUrl100 = music.artworkUrl100
		product.trackViewURL = music.trackViewURL

		let viewsNumber = MVPViewsNumber(context: context)

		product.viewsCount = viewsNumber

		saveContext()

	}

	func mvpPrepare(content: Content?) {

		guard let results = content?.results else { fatalError() }

			for item in results {
				createMVPEntity(from: item)
			}

	}

}
