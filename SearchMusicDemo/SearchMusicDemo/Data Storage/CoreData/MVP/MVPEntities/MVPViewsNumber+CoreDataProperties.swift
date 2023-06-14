
import Foundation
import CoreData


extension MVPViewsNumber {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MVPViewsNumber> {
        return NSFetchRequest<MVPViewsNumber>(entityName: "MVPViewsNumber")
    }

    @NSManaged public var views: Int16
    @NSManaged public var owner: MVPProduct?

}

extension MVPViewsNumber : Identifiable {

}
