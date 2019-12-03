//
//  MainViewController.swift
//  Recipes
//
//  Created by Lambda_School_Loaner_218 on 12/2/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let networkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableVC?.recipes = filteredRecipes
        }
    }
    var recipesTableVC: RecipesTableViewController? {
        didSet {
            recipesTableVC?.recipes = filteredRecipes
        }
    }
    

    @IBOutlet weak var recipeName: UITextField!
    
    
    @IBAction func textClick(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRecipes()
        
    }
    
    func fetchRecipes() {
        networkClient.fetchRecipes { recipes, error in
            if let error = error {
                NSLog("\(error)")
                return
            }
            DispatchQueue.main.async {
                guard let recipes = recipes else { return }
                self.allRecipes = recipes
            }
        }
    }
    
    func filterRecipes() {
        guard let term = recipeName.text, !term.isEmpty else {
            filteredRecipes = allRecipes
            return
        }
        filteredRecipes = allRecipes.filter { $0.name.contains(term.capitalized) }
    }
    
    // MARK: - Navigation

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedTabelView" {
            guard let recipesTableVC = segue.destination as? RecipesTableViewController else { return }
            self.recipesTableVC = recipesTableVC
        }
    }
    

}
