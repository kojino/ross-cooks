//
//  Recipe.swift
//  RossCooks
//
//  Created by Luca Hagel on 10/13/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit
struct Step {
  let stepTitle: String
  let image: String
  let description: String
}

struct Recipe {
  let title: String
  //let rating: Int
  let thumbsUp: Int
  let thumbsDown: Int
  let timeRequired: String
  let difficulty: Int
  let image: String
  let tools: [String]
  let ingredients: [String]
  let tags: [String]
  let steps: [Step]
}
