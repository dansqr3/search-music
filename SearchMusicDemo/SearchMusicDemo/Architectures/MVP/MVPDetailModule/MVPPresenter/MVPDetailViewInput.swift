
import Foundation
import SafariServices

protocol MVPDetailViewInput: AnyObject {

	func setupDelegate()

	func configure(_ content: MVPProduct)

	func makeNotification()

	func presentSafariVC(_ viewController: SFSafariViewController)

}
