//
//  RecipleaseData.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 22/04/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation

// structure to manage data
struct RecipleaseData: Decodable {
    let count: Int
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let label: String
    let image: URL
    let url: URL
    let ingredientLines: [String]
    let ingredients: [Ingredient]
    let totalTime: Float
    let yield: Float
    let uri: String
}

struct Ingredient: Decodable {
    let text: String
    let weight: Float
}

