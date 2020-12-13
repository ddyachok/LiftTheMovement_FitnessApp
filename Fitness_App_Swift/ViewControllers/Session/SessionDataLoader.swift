//
//  SessionDataLoader.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 10.12.2020.
//

import Foundation

//public class SessionDataLoader {
//    @Published var exercises: [Exercise] = []
//    
//    init() {
//        load()
//    }
//    
//    func load() {
//        
//        if let fileLocation = Bundle.main.url(forResource: "sessions", withExtension: "json") {
//            
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                let jsonDecoder = JSONDecoder()
//                let dataFromJson = try jsonDecoder.decode([Exercise].self, from: data)
//                self.exercises = dataFromJson
//                
//            } catch {
//                print(error)
//            }
//        }
//    }
//}
