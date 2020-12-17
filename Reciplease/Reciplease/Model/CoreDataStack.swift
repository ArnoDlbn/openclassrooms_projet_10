//
//  CoreDataStack.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 05/08/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataStack {

    // MARK: - Properties
    
    let modelName: String
    
    // MARK: - Initialization
    
    init(modelName: String){
        self.modelName = modelName
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext () {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
