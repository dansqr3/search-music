
import Foundation
import CoreData


extension MVPProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MVPProduct> {
        return NSFetchRequest<MVPProduct>(entityName: "MVPProduct")
    }

    @NSManaged public var artistName: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var collectionName: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var trackName: String?
    @NSManaged public var trackViewURL: String?
    @NSManaged public var viewsCount: MVPViewsNumber?

}

extension MVPProduct : Identifiable {

}
