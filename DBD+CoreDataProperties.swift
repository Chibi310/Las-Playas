//
//  DBD+CoreDataProperties.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
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

}

extension DBD : Identifiable {

}
