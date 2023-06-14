
import Foundation
import CoreData


extension MVVMViewsNumber {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MVVMViewsNumber> {
        return NSFetchRequest<MVVMViewsNumber>(entityName: "MVVMViewsNumber")
    }

    @NSManaged public var views: Int16
    @NSManaged public var owner: MVVMProduct?

}

extension MVVMViewsNumber : Identifiable {

}
