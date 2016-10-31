//
//  RecipeViewController.swift
//  RossCooks
//
//  Created by Luca Hagel on 10/13/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController {
  var recipe: Recipe!
  
  var requirementsCellHeight:CGFloat = 225
  
  let numberOfCellsBeforeSteps = 3
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //tableView.allowsSelection = false;
    
    
    // Along with auto layout, these are the keys for enabling variable cell height
    tableView.estimatedRowHeight = 44.0
    tableView.rowHeight = UITableViewAutomaticDimension
    
    self.navigationItem.title = recipe.title
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecipePhoto", for: indexPath) as! RecipeImageTableViewCell
      cell.recipeImageView?.image = UIImage(named: recipe.image)
      cell.recipeImageView.contentMode = .scaleAspectFill
      cell.isUserInteractionEnabled = false
      
      return cell
    case 1: // BelowImageView
      let cell = tableView.dequeueReusableCell(withIdentifier: "BelowImageView", for: indexPath) as! BelowImageTableViewCell
      cell.labelThumbsDown.text = String(recipe.thumbsDown)
      cell.labelThumbsUp.text = String(recipe.thumbsUp)
      cell.labelTimeRequired.text = recipe.timeRequired
      
      // hide the separator line for this cell
      cell.separatorInset = UIEdgeInsetsMake(0, tableView.frame.size.width, 0, 0);
      cell.isUserInteractionEnabled = false
      
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "requirementsCell", for: indexPath) as! RequirementsTableViewCell
      
      let ingredientsList = recipe.ingredients
      let toolsList = recipe.tools
      
      cell.labelIngredients.lineBreakMode = NSLineBreakMode.byWordWrapping
      cell.labelTools.lineBreakMode = NSLineBreakMode.byWordWrapping
      
      cell.labelIngredients.numberOfLines = 0
      cell.labelTools.numberOfLines = 0
      
      cell.labelIngredients.text = ""
      cell.labelTools.text = ""
      
      for ingredient in ingredientsList {
        cell.labelIngredients.text?.append(ingredient + "\n")
      }
      
      for tool in toolsList {
        cell.labelTools.text?.append(tool + "\n")
      }
      
      // hide the separator line for this cell
      cell.separatorInset = UIEdgeInsetsMake(0, tableView.frame.size.width, 0, 0);
      cell.isUserInteractionEnabled = false
      
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: "stepsLabelCell", for: indexPath)
      cell.isUserInteractionEnabled = false
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
      cell.textLabel?.text = recipe.steps[indexPath.row - numberOfCellsBeforeSteps].description
      cell.textLabel?.numberOfLines = 0
      cell.selectionStyle = .none
      
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipe.steps.count + numberOfCellsBeforeSteps
  }
  
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
      case 0:
        return 110
      case 2:
        return 150
      default:
        return UITableViewAutomaticDimension
    }
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
