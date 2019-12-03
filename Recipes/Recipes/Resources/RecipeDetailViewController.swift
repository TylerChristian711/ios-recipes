//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Lambda_School_Loaner_218 on 12/2/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var recipe: Recipe? {
        
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var instructionsText: UITextField!
    
    
    func updateViews() {
        guard let recipe = recipe, self.isViewLoaded else { return }
        NameLabel.text = recipe.name
        instructionsText.text = recipe.instructions
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
