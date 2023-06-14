
import Foundation

protocol MVPCoreDataManagerProtocol: CoreDataManagerProtocol {

	func createMVPEntity(from music: Music)

	func mvpPrepare(content: Content?)

}
