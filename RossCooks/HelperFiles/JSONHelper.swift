//
//  JSONHelper.swift
//  RossCooks
//
//  Created by Luca Hagel on 10/18/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONHelper {
    static func loadTestRecipes() -> [Recipe] {
        let path: URL = Bundle.main.url(forResource: "data", withExtension: "json")!
      var file: Data? = nil
        do {
          file = try Data(contentsOf: path)
        }
        catch is NSError {
          print("fail")
        }
        let json = JSON(data: file!)
        
        var recipeArray: [Recipe] = []
        for recipe in json["Recipes"].arrayValue {
            recipeArray += [self.parseJSONToRecipe(recipeJSON: recipe)]
        }
        return recipeArray
    }
    
    private static func parseJSONToRecipe(recipeJSON: JSON) -> Recipe {
        var toolsArray: [String] = []
        for tool in recipeJSON["Tools"].arrayValue {
            toolsArray += [tool.stringValue]
        }
        
        var ingredientsArray: [String] = []
        for ingredient in recipeJSON["Ingredients"].arrayValue {
            ingredientsArray += [ingredient.stringValue]
        }
        
        var tagsArray: [String] = []
        for tag in recipeJSON["Tags"].arrayValue {
            tagsArray += [tag.stringValue]
        }
        
        var stepsArray: [Step] = []
        for step in recipeJSON["Steps"].arrayValue {
            stepsArray += [Step(stepTitle: step["Step_Title"].stringValue,
                               image: step["imgage"].stringValue, //TODO: Fix spelling
                               description: step["description"].stringValue)]
        }
        
        let recipe = Recipe(title: recipeJSON["Title"].stringValue,
                            //rating: recipeJSON["Rating"].intValue,
                            thumbsUp: recipeJSON["Upvotes"].intValue,
                            thumbsDown: recipeJSON["Downvotes"].intValue,
                            timeRequired: recipeJSON["Time"].stringValue,
                            difficulty: recipeJSON["Difficulty"].intValue,
                            image: recipeJSON["image"].stringValue,
                            tools: toolsArray,
                            ingredients: ingredientsArray,
                            tags: tagsArray,
                            steps: stepsArray)
        return recipe
    }
}
