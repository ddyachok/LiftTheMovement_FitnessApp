//
//  SideMenuModel.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 09.12.2020.
//

import Foundation

enum SideMenuModel: Int, CustomStringConvertible {
    case Home
    case Profile
    case Exercises
    case About
    
    var description: String {
        switch self {
        case .Home: return "Home"
        case .Profile: return "Profile"
        case .Exercises: return "Exercises"
        case .About: return "About"
        }
    }
    
}
