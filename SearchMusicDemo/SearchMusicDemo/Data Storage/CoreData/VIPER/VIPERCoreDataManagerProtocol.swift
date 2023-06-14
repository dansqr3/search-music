
import Foundation

protocol VIPERCoreDataManagerProtocol: CoreDataManagerProtocol {

	func createVIPEREntity(from music: Music)

	func viperPrepare(content: Content?)

}
