
import Foundation
import UIKit

protocol MVPRouterProtocol {

	var navigationController: UINavigationController? { get set }

	var mvpAssembly: MVPAssemblyProtocol? { get set }

	func initialMainViewController()

	func pushDetailViewController(content: MVPProduct)

}
