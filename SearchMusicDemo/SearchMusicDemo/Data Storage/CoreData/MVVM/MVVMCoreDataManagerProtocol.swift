
import Foundation

protocol MVVMCoreDataManagerProtocol: CoreDataManagerProtocol {

	func createMVVMEntity(from music: Music)

	func mvvmPrepare(content: Content?)

}
