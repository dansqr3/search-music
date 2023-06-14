
import Foundation
import UIKit

protocol MVVMDetailViewModelProtocol {

	var configureSignal: Dynamic<ContentConfigure> { get }

	func configure(_ content: MVVMProduct)

}
