//
//  CoreDataService.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 05.01.2021.
//

import UIKit
import CoreData

class CoreDataService: Database {
    
    // Helper func for getting the current context.
    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
    
    func create<T>(type: T.Type) -> T? {
        guard let context = getContext() else { return nil }
        guard let model = type as? NSManagedObject.Type else { return nil }
        guard let newObject = NSManagedObject(entity: model.entity(), insertInto: context) as? T else {
            return nil
        }
        
        return newObject
    }
    
    func fetchObjects<T>(of type: T.Type, sortDescriptor: Sorted?, predicate: NSPredicate?) -> [T] {
        guard let context = getContext() else { return [] }
        guard let model = type as? NSManagedObject.Type else { return [] }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = model.entity()
        
        if let sortDescriptor = sortDescriptor {
            let nsSortDescriptor = NSSortDescriptor(key: sortDescriptor.key, ascending: sortDescriptor.ascending)
            fetchRequest.sortDescriptors = [nsSortDescriptor]
        }
        
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        
        let objects = try? context.fetch(fetchRequest) as? [T]
        
        return objects ?? []
    }
    
    func delete(_ object: DatabaseObject) {
        guard let context = getContext() else { return }
        guard let object = object as? NSManagedObject else { return }
        context.delete(object)
        saveChanges()
    }
    
    func saveChanges() {
        try? getContext()?.save()
    }
}
