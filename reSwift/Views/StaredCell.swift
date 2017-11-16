//
//  StaredCell.swift
//  reSwift
//
//  Created by Ruslan Yupyn on 10/19/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class StaredCell: UITableViewCell {
    
    @IBOutlet weak var avatarIV: UIImageView! {
        didSet {
            avatarIV.layer.cornerRadius = 8
            avatarIV.clipsToBounds = true
        }
    }
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var timeAgoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
