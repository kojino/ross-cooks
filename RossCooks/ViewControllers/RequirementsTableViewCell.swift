//
//  RequirementsTableViewCell.swift
//  RossCooks
//
//  Created by Ross Justin on 10/20/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class RequirementsTableViewCell: UITableViewCell {
    @IBOutlet weak var textViewIngredients: UITextView!
    @IBOutlet weak var textViewTools: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
