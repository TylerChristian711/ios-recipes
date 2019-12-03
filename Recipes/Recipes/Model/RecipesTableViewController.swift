//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Lambda_School_Loaner_218 on 12/2/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
   
   
    var recipes: [Recipe] = [] {
        
        didSet {
            tableView.reloadData()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath)
        let aRecipe = recipes[indexPath.row]
        cell.textLabel?.text = aRecipe.name
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRecipeDetail" {
            guard let recipeDetailVC = segue.destination as? RecipeDetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let recipe = recipes[indexPath.row]
            recipeDetailVC.recipe = recipe
        }
    }
}
