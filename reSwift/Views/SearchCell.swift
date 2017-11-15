//
//  SearchCell.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 10/17/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var avatarIV: UIImageView! {
        didSet {
            avatarIV.layer.cornerRadius = 8
            avatarIV.clipsToBounds = true
        }
    }
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var staredCountLbl: UILabel!
    @IBOutlet weak var lovedCountLbl: UILabel!
    @IBOutlet weak var sharedCountLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
