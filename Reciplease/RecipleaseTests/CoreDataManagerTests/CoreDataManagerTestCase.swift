//
//  CoreDataManagerTestCase.swift
//  RecipleaseTests
//
//  Created by Arnaud Dalbin on 05/08/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import XCTest
@testable import Reciplease

class CoreDataManagerTestCase: XCTestCase {
    
    // MARK: - Properties
    
    var coreDataStack: MockCoreDataStack!
    var coreDataManager: CoreDataManager!
    
    // MARK: - Tests Life Cycle
    
    override func setUp() {
        super.setUp()
        coreDataStack = MockCoreDataStack()
        coreDataManager = CoreDataManager(coreDataStack: coreDataStack)
    }
    
    override func tearDown() {
        super.tearDown()
        coreDataManager = nil
        coreDataStack = nil
    }
    
    // MARK: - Tests
    
    func testAddRecipeToFavoritesMethods_WhenAnEntityIsCreated_ThenShouldBeCorrectlySaved() {
        coreDataManager.addRecipe(title: "Chicken Vesuvio", totalTime: "", ingredients: "", yield: "http://www.recipes.com/recipes/8793/", image: "", uri: "111", url: "")
        XCTAssertTrue(!coreDataManager.favoriteRecipe.isEmpty)
        XCTAssertTrue(coreDataManager.favoriteRecipe.count == 1)
        XCTAssertTrue(coreDataManager.favoriteRecipe[0].title! == "Chicken Vesuvio")
    }
    
    func testDeleteOneRecipeMethod_WhenEntityIsDeleted_ThenShouldBeCorrectlyDeleted() {
        coreDataManager.removeRecipe(recipeUri: "111")
        coreDataManager.addRecipe(title: "Chicken Vesuvio", totalTime: "", ingredients: "", yield: "http://www.recipes.com/recipes/8793/", image: "", uri: "123", url: "")
        coreDataManager.addRecipe(title: "Strong Cheese", totalTime: "", ingredients: "", yield: "http://www.recipes.com/recipes/8793/", image: "", uri: "456", url: "")
        coreDataManager.removeRecipe(recipeUri: "123")
        debugPrint(coreDataManager.favoriteRecipe.count)
        XCTAssertTrue(!coreDataManager.favoriteRecipe.isEmpty)
        XCTAssertTrue(coreDataManager.favoriteRecipe.count == 1)
        XCTAssertTrue(coreDataManager.favoriteRecipe[0].uri! == "456")
    }
    
    func testCheckingIfRecipeIsAlreadyFavorite_WhenFuncIsCalling_ThenShouldReturnTrue() {
        coreDataManager.addRecipe(title: "Chicken Vesuvio", totalTime: "", ingredients: "", yield: "http://www.recipes.com/recipes/8793/", image: "", uri: "123", url: "")
        XCTAssertTrue(coreDataManager.checkIfRecipeIsAlreadySaved(recipeUri: "123"))
    }
    
}
