//
//  DBD+CoreDataProperties.swift
//  Las Playas
//
//  Created by Maricel Sumulong on 3/9/22.
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
    @NSManaged public var feedback: String?

}

extension DBD : Identifiable {

}
