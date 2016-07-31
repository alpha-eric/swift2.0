//
//  restuarantPictureTableViewCell.swift
//  FoodPicture
//
//  Created by Psychesnet on 7/30/16.
//  Copyright © 2016 Psychesnet. All rights reserved.
//

import UIKit

class RestuarantPictureTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var locationLabel: UILabel?
    @IBOutlet var thumbnailImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
