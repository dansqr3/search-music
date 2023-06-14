
import Foundation
import UIKit

protocol VIPERDetailInteractorOutput: AnyObject {

	func setImage(_ content: UIImage)
	func setTitle(_ content: String)
	func setCollectionNameLabel(_ content: String)
	func setReleaseDateLabel(_ content: String)
	func setTrackViewURLLabel(_ content: String)

	func presentSafari(with url: URL)

}
