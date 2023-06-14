
import Foundation

extension CoreDataManager: MVVMCoreDataManagerProtocol {

	func createMVVMEntity(from music: Music) {

		let product = MVVMProduct(context: context)

		product.artistName = music.artistName
		product.trackName = music.trackName
		product.collectionName = music.collectionName
		product.releaseDate = music.releaseDate
		product.artworkUrl100 = music.artworkUrl100
		product.trackViewURL = music.trackViewURL

		let viewsNumber = MVVMViewsNumber(context: context)

		product.viewsCount = viewsNumber

		saveContext()

	}

	func mvvmPrepare(content: Content?) {

		guard let results = content?.results else { fatalError() }

			for item in results {
				createMVVMEntity(from: item)
			}

	}

}
