//
//  SearchResultViewController.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 05/05/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import UIKit

class SearchResultViewController: UITableViewController {
    
    // MARK: - Properties
    
    let recipeService = RecipleaseService()
    var recipes = [Hit]()
    var dataRecipe: RecipleaseData?
    var ingredients = [String]()
    var from = 0
    var to = 10
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataRecipe?.hits.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe = dataRecipe!.hits[indexPath.row].recipe
           
        cell.recipeTitle.text = "\(recipe.label)"
        cell.recipeIngredients.text = "\(recipe.ingredientLines.joined(separator: ","))"
        
        let imageData = NSData(contentsOf: NSURL(string: "\(recipe.image)")! as URL)
        cell.recipeImage.image = UIImage(data: imageData! as Data)
        cell.recipeImage.addBlackGradientLayerInForeground()

        cell.recipeYield.text = "\(recipe.yield)"
        cell.recipeTime.text = "\(recipe.totalTime)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = dataRecipe!.hits[indexPath.row].recipe
        performSegue(withIdentifier: "ResultToDetail", sender: recipe)
    }
    
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        recipe.request(to: 40, ingredients: ingredients, completionHandler: { (recipe, error) in
//                    DispatchQueue.main.async {
//                        if error == nil {
//                            self.dataRecipe = recipe
//                        } else {
//                            self.alert(title: "Erreur", message: "Veuillez vérifier les informations renseignées et votre connexion !")
//                        }
//                    }
//                })
//    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        from += 10
        to += 10
        recipeService.request(from: from, to: to, ingredients: ingredients, completionHandler: { (recipe, error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.dataRecipe = recipe
                    self.tableView.reloadData()
                } else {
                    self.alert(title: "Erreur", message: "Veuillez vérifier les informations renseignées et votre connexion !")
                }
            }
        })
    }
    
    // MARK: - View life cycle
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dataController = segue.destination as? RecipeController {
            dataController.recipe = sender as? Recipe
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
