//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Loyio on 2/10/21.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageVIew: UIImageView! {
        didSet {
            thumbnailImageVIew.layer.cornerRadius = thumbnailImageVIew.bounds.width / 2
            thumbnailImageVIew.clipsToBounds = true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
