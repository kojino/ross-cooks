//
//  RecipeListTableViewCell.swift
//  RossCooks
//
//  Created by Luca Hagel on 10/13/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class RecipeListTableViewCell: UITableViewCell {
  
    @IBOutlet weak var recipeTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
