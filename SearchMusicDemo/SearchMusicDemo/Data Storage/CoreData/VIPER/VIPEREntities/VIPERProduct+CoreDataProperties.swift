
import Foundation
import CoreData


extension VIPERProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VIPERProduct> {
        return NSFetchRequest<VIPERProduct>(entityName: "VIPERProduct")
    }

    @NSManaged public var artistName: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var collectionName: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var trackName: String?
    @NSManaged public var trackViewURL: String?
    @NSManaged public var viewsCount: VIPERViewsNumber?

}

extension VIPERProduct : Identifiable {

}
