//
//  DBD+CoreDataProperties.swift
//  Las Playas
//
//  Created by Stan Shockley on 3/8/22.
//
//

import Foundation
import CoreData


extension DBD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBD> {
        return NSFetchRequest<DBD>(entityName: "DBD")
    }

    @NSManaged public var password: String?
    @NSManaged public var userName: String?
    @NSManaged public var q1Rating: String?
    @NSManaged public var q2Rating: String?
    @NSManaged public var q3Rating: String?
    @NSManaged public var comments: String?

}

extension DBD : Identifiable {

}
