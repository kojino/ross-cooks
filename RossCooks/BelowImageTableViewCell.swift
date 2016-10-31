//
//  BelowImageTableViewCell.swift
//  RossCooks
//
//  Created by Ross Justin on 10/31/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class BelowImageTableViewCell: UITableViewCell {
  
  @IBOutlet weak var labelThumbsUp: UILabel!
  @IBOutlet weak var labelThumbsDown: UILabel!
  @IBOutlet weak var labelTimeRequired: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
