
import Foundation

// MARK: - Content
struct Content: Codable {
	let resultCount: Int?
	let results: [Music]?
}

// MARK: - Result
struct Music: Codable {
	let artistName, collectionName, trackName: String?
	let trackViewURL: String?
	let previewURL: String?
	let artworkUrl100: String?
	let releaseDate: String?

	enum CodingKeys: String, CodingKey {
		case artistName, collectionName, trackName
		case trackViewURL = "trackViewUrl"
		case previewURL = "previewUrl"
		case artworkUrl100, releaseDate
	}
}
