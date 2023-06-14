
import UIKit

protocol MVPAssemblyProtocol {

	func createMVPMain(router: MVPRouterProtocol) -> UIViewController

	func createMVPDetail(content: MVPProduct, router: MVPRouterProtocol) -> UIViewController

}
