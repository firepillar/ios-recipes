//
//  RecipeTableViewController.swift
//  Recipes
//
//  Created by Kat Milton on 6/17/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    
    
    
    var mainVC = MainViewController()
    
    var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchController = UISearchController()
    
    var filteredRecipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = ({
        let controller = UISearchController(searchResultsController: nil)

        controller.searchResultsUpdater = self
        controller.hidesNavigationBarDuringPresentation = false
        controller.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = controller.searchBar
        
            return controller
        })()
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return recipes.count
        
        if (searchController.isActive) {
            return filteredRecipes.count
        } else {
            return recipes.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)

        // Configure the cell...
        
        if (searchController.isActive) {
            cell.textLabel?.text = filteredRecipes[indexPath.row].name
            return cell
        } else {
            cell.textLabel?.text = recipes[indexPath.row].name
            return cell
        }
        
        
        
//        let aRecipe = recipes[indexPath.row]
//        cell.textLabel?.text = aRecipe.name
//
//        return cell
    }
    

    func updateSearchResults(for searchController: UISearchController) {
        filteredRecipes.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (recipes as NSArray).filtered(using: searchPredicate)
        filteredRecipes = array as! [Recipe]
        tableView.reloadData()
    }
    
    private func recipeFor(indexPath: IndexPath) -> Recipe {
        if indexPath.section == 0 {
            return recipes[indexPath.row]
        } else {
            return recipes[indexPath.row]
        }
    
    }

    
   
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRecipe" {
            guard let recipeDetailVC = segue.destination as? RecipeDetailViewController else { return }
            guard let index = tableView.indexPathForSelectedRow else { return }
            recipeDetailVC.recipe = recipeFor(indexPath: index)
        }
    }
    

}
