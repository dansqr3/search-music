
import Foundation

extension CoreDataManager: VIPERCoreDataManagerProtocol {

	func createVIPEREntity(from music: Music) {

		let product = VIPERProduct(context: context)

		product.artistName = music.artistName
		product.trackName = music.trackName
		product.collectionName = music.collectionName
		product.releaseDate = music.releaseDate
		product.artworkUrl100 = music.artworkUrl100
		product.trackViewURL = music.trackViewURL

		let viewsNumber = VIPERViewsNumber(context: context)

		product.viewsCount = viewsNumber

		saveContext()

	}

	func viperPrepare(content: Content?) {

		guard let results = content?.results else { fatalError() }

			for item in results {
				createVIPEREntity(from: item)
			}

	}

}
