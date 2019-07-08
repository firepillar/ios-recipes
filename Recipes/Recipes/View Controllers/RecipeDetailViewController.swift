//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Kat Milton on 7/8/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet var recipeNameLabel: UILabel!
    @IBOutlet var recipeInstructions: UITextView!
    
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    
    func updateViews() {
        guard isViewLoaded == true ,
            let recipe = recipe else { return }
        
        recipeNameLabel.text = recipe.name
        recipeInstructions.text = recipe.instructions
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
