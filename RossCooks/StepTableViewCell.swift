//
//  StepTableViewCell.swift
//  RossCooks
//
//  Created by Ross Justin on 10/31/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit

class StepTableViewCell: UITableViewCell {
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var stepLabel: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
