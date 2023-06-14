
import Foundation
import UIKit

protocol MVVMRouterProtocol {

	var navigationController: UINavigationController? { get set }

	var mvvmAssembly: MVVMAssemblyProtocol? { get set }

	func initialMainViewController()

	func pushDetailViewController(content: MVVMProduct)

}
