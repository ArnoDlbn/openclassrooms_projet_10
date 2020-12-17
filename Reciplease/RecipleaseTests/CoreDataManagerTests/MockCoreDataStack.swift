//
//  MockCoreDataStack.swift
//  RecipleaseTests
//
//  Created by Arnaud Dalbin on 05/08/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation
import CoreData
@testable import Reciplease

class MockCoreDataStack: CoreDataStack {
    
    // MARK: - Initialization
    
    convenience init() {
        self.init(modelName: "Reciplease")
    }
    
    override init(modelName: String) {
        super.init(modelName: modelName)
        
        let desc = NSPersistentStoreDescription()
        desc.type = NSInMemoryStoreType
        self.persistentContainer.persistentStoreDescriptions = [desc]
    }
}
