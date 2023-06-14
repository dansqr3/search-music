
import UIKit

class FetchData: FetchDataProtocol {

	private let networkService = NetworkService()
	private let cacheData = CacheData()

	func fetch(urlString: String, completion: @escaping (Content?) -> Void) {

		networkService.request(urlString: urlString) { content in

			switch content {

				case .success(let data):
					do {
						let content = try JSONDecoder().decode(Content.self, from: data)
						completion(content)

					} catch {
						print(error.localizedDescription)
					}

				case .failure(let error):
					completion(nil)
					print(error)
			}

		}

	}

	func loadImageFrom(stringURL: String, completion: @escaping (UIImage?) -> Void) {

		guard stringURL != "",
			  let url = URL(string: stringURL) else { return }

		let nsStringURL = stringURL as NSString

		if let cachedImage = cacheData.load(nsStringURL) {

			completion(cachedImage)

		} else {

			URLSession.shared.dataTask(with: url) { data, response, error in

				if let error = error {
					print(error)

				} else {

					guard let data else { fatalError("data error") }

					if let picture = UIImage(data: data) {

						self.cacheData.save(image: picture, for: nsStringURL)

						DispatchQueue.main.async {
							completion(picture)
						}

					}

				}

			}.resume()

		}

	}

}
