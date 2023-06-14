
import Foundation
import CoreData


extension MVVMProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MVVMProduct> {
        return NSFetchRequest<MVVMProduct>(entityName: "MVVMProduct")
    }

    @NSManaged public var artistName: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var collectionName: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var trackName: String?
    @NSManaged public var trackViewURL: String?
    @NSManaged public var viewsCount: MVVMViewsNumber?

}

extension MVVMProduct : Identifiable {

}
