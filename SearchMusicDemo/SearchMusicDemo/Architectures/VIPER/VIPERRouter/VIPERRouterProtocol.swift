
import Foundation
import UIKit
import SafariServices

protocol VIPERRouterProtocol {

	var navigationController: UINavigationController? { get set }

	var viperAssembly: VIPERAssemblyProtocol? { get set }

	func initialMainViewController()

	func pushDetailViewController(content: VIPERProduct)

	func presentSafari(_ safariVC: SFSafariViewController, in viewController: UIViewController)

}
