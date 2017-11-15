//
//  UserCell.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 11/14/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var avatarIV: UIImageView! {
        didSet {
            avatarIV.layer.cornerRadius = 15
            avatarIV.clipsToBounds = true
        }
    }
    @IBOutlet weak var userNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
