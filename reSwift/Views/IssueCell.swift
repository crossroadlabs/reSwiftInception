//
//  IssueCell.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 11/16/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class IssueCell: UITableViewCell {
    
    @IBOutlet weak var issueNumberLbl: UILabel!
    @IBOutlet weak var issueTypeLbl: UILabel!
    
    @IBOutlet weak var issueTitleLbl: UILabel!
    
    @IBOutlet weak var issueStatusLbl: UILabel!
    @IBOutlet weak var issueAssignedLbl: UILabel!
    @IBOutlet weak var issueCommentsLbl: UILabel!
    @IBOutlet weak var issueTimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
