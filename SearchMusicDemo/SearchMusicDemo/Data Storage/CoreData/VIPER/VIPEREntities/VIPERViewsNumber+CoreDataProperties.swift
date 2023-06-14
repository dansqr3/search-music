
import Foundation
import CoreData


extension VIPERViewsNumber {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VIPERViewsNumber> {
        return NSFetchRequest<VIPERViewsNumber>(entityName: "VIPERViewsNumber")
    }

    @NSManaged public var views: Int16
    @NSManaged public var owner: VIPERProduct?

}

extension VIPERViewsNumber : Identifiable {

}
