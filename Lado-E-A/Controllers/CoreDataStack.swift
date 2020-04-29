//
//  CoreDataStock.swift
//  Lado-E-A
//
//  Created by Admin on 4/18/20.
//  Copyright © 2020 myapps. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    private let modelName : String
    
   
    
    init(modelName : String) {
        self.modelName = modelName
        
    }
   
    
    private lazy var storeContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores {(storeDescription ,Error) in
            if let error = Error as NSError? {
                print( "unrisolved error  \(error) ")
            }
        }
        return container
    }()
    
    lazy var managedContext : NSManagedObjectContext = {
           return self.storeContainer.viewContext
       }()
    
    
    func saveContext () {
        guard managedContext.hasChanges else {return}
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print ("error was \(error)")
        }
    }
}

