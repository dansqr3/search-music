
import UIKit

protocol VIPERAssemblyProtocol {

	func createVIPERMain(router: VIPERRouterProtocol) -> UIViewController

	func createVIPERDetail(content: VIPERProduct, router: VIPERRouterProtocol) -> UIViewController

}
