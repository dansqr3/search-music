
import Foundation
import UIKit

protocol FetchDataProtocol {

	func fetch(urlString: String, completion: @escaping (Content?) -> Void)

	func loadImageFrom(stringURL: String, completion: @escaping (UIImage?) -> Void)

}
