
import Foundation
import UIKit

protocol VIPERDetailViewControllerInput: AnyObject {

	func setImage(_ content: UIImage)
	func setTitle(_ content: String)
	func setCollectionNameLabel(_ content: String)
	func setReleaseDateLabel(_ content: String)
	func setTrackViewURLLabel(_ content: String)

}
