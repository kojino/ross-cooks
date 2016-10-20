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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Along with auto layout, these are the keys for enabling variable cell height
        //tableView.estimatedRowHeight = 44.0
        //tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipePhoto", for: indexPath)
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "requirementsCell", for: indexPath) as! RequirementsTableViewCell
            cell.textViewIngredients.text = "Ingredients list here"
            cell.textViewTools.text = "Tools list here"
            cell.textViewIngredients.sizeToFit()
            cell.textViewTools.sizeToFit()
            
            if cell.textViewTools.contentSize.height > cell.textViewIngredients.contentSize.height {
                requirementsCellHeight = cell.textViewTools.contentSize.height
            }
            else {
                requirementsCellHeight = cell.textViewIngredients.contentSize.height
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "requirementsCell", for: indexPath)
            return cell
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110
        }
        else if indexPath.row == 1 {
            return requirementsCellHeight
        }
        else {
            return 44
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
