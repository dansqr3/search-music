
import UIKit

protocol MVVMAssemblyProtocol {

	func createMVVMMain(router: MVVMRouterProtocol) -> UIViewController

	func createMVVMDetail(content: MVVMProduct) -> UIViewController

}
