//
//  RecipeImageTableViewCell.swift
//  RossCooks
//
//  Created by Ross Justin on 10/25/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class RecipeImageTableViewCell: UITableViewCell {
  @IBOutlet weak var recipeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
