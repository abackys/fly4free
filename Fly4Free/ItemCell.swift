//
//  ItemCell.swift
//  Fly4Free
//
//  Created by MacBook on 7/13/15.
//  Copyright (c) 2015 opendev. All rights reserved.
//

import UIKit
import Alamofire

class ItemCell: UITableViewCell {

    @IBOutlet weak var thubnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var request: Alamofire.Request?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
