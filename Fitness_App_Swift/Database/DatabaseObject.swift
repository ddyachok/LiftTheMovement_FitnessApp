//
//  DatabaseObject.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 05.01.2021.
//

import Foundation
import CoreData

protocol DatabaseObject {}

extension NSManagedObject: DatabaseObject {}
