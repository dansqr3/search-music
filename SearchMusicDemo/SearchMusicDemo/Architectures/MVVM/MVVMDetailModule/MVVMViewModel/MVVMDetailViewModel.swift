
import Foundation
import UIKit

struct ContentConfigure {

	var imageString: String?
	var artistName: String?
	var trackName: String?
	var collectionName: String?
	var releaseDate: String?
	var trackViewURL: String?

}

class MVVMDetailViewModel: MVVMDetailViewModelProtocol {

	var configureSignal: Dynamic<ContentConfigure> = Dynamic(value: ContentConfigure())

	func configure(_ content: MVVMProduct) {

		var contentConfigure = ContentConfigure()

		contentConfigure.imageString = content.artworkUrl100
		contentConfigure.artistName = content.artistName
		contentConfigure.trackName = content.trackName
		contentConfigure.collectionName = content.collectionName
		contentConfigure.releaseDate = content.releaseDate
		contentConfigure.trackViewURL = content.trackViewURL

		configureSignal.value = contentConfigure

	}

}
