
import Foundation

class NetworkService {

	func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {

		guard let url = URL(string: urlString) else { return }

		URLSession.shared.dataTask(with: url) { data, response, error in

			DispatchQueue.main.async {

				if let error = error {
					completion(.failure(error))
				} else {
					guard let data else { return }
					completion(.success(data))
				}

			}

		}.resume()

	}

}
