//
//  Database.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 05.01.2021.
//

import Foundation

protocol Database {
    func create<T: DatabaseObject>(type: T.Type) -> T?
    func fetchObjects<T: DatabaseObject>(of type: T.Type, sortDescriptor: Sorted?, predicate: NSPredicate?) -> [T]
    func delete(_ object: DatabaseObject)
    func saveChanges()
}
