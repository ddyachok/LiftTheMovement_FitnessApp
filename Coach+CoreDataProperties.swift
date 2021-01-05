//
//  Coach+CoreDataProperties.swift
//  
//
//  Created by Daniel Dyachok on 05.01.2021.
//
//

import Foundation
import CoreData


extension Coach {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coach> {
        return NSFetchRequest<Coach>(entityName: "Coach")
    }

    @NSManaged public var fName: String?
    @NSManaged public var age: Int16
    @NSManaged public var coach: Coach?

}
