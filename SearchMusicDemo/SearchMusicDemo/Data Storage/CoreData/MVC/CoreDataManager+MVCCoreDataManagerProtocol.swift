
import Foundation
import CoreData

extension CoreDataManager: MVCCoreDataManagerProtocol {

	func createMVCEntity(from music: Music) {

		let product = MVCProduct(context: context)

		product.artistName = music.artistName
		product.trackName = music.trackName
		product.collectionName = music.collectionName
		product.releaseDate = music.releaseDate
		product.artworkUrl100 = music.artworkUrl100
		product.trackViewURL = music.trackViewURL

		let viewsNumber = MVCViewsNumber(context: context)

		product.viewsCount = viewsNumber

		saveContext()

	}

	func mvcPrepare(content: Content?) {

		guard let results = content?.results else { fatalError() }

			for item in results {
				createMVCEntity(from: item)
			}

	}

}
