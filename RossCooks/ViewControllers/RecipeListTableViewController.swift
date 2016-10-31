//
//  RecipeListTableViewController.swift
//  RossCooks
//
//  Created by Luca Hagel on 10/18/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RecipeListTableViewController: UITableViewController {
  //@IBOutlet var tableView: UITableView!
  
  @IBOutlet weak var loginButton: UIBarButtonItem!
  
    var recipes: [Recipe]! {
      didSet {
        tableView.reloadData()
      }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let backgroundImage = UIImage(named: "spinach")
        let backgroundView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = backgroundView
        self.tableView.backgroundView?.contentMode = .scaleAspectFill

        recipes = JSONHelper.loadTestRecipes()
    }
  
  override func viewDidAppear(_ animated: Bool) {
    if let user = FIRAuth.auth()?.currentUser {
      self.loginButton.title = user.email
    }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeListTableViewCell
      
        // Configure the cell...
        cell.recipeTitleLabel.text = recipes[indexPath.row].title
        cell.recipeTitleLabel.sizeToFit()
      
      
        //cell.backgroundColor = UIColor.black
      
        cell.recipeTitleLabel.textColor = UIColor.white

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      if segue.identifier == "ShowRecipe" {
        let destination = segue.destination as! RecipeViewController
        if let indexPath = tableView.indexPathForSelectedRow {
          destination.recipe = recipes[indexPath.row]
        }
      }
    }

}
