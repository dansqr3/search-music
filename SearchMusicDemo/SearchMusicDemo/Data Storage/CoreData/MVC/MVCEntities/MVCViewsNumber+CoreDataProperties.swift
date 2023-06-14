
import Foundation
import CoreData


extension MVCViewsNumber {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MVCViewsNumber> {
        return NSFetchRequest<MVCViewsNumber>(entityName: "MVCViewsNumber")
    }

    @NSManaged public var views: Int16
    @NSManaged public var owner: MVCProduct?

}

extension MVCViewsNumber : Identifiable {

}
