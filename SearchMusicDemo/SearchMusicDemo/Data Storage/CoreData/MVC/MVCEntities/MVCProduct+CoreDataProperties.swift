
import Foundation
import CoreData


extension MVCProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MVCProduct> {
        return NSFetchRequest<MVCProduct>(entityName: "MVCProduct")
    }

    @NSManaged public var artistName: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var collectionName: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var trackName: String?
    @NSManaged public var trackViewURL: String?
    @NSManaged public var viewsCount: MVCViewsNumber?

}

extension MVCProduct : Identifiable {

}
