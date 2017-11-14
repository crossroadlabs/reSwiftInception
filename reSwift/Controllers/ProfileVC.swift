//
//  ProfileVC.swift
//  reSwift
//
//  Created by Ruslan Yupyn on 10/19/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileFullName: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet var profileTopBorderedViews: [UIView]!
    @IBOutlet var profileBottomBorderedViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileTopBorderedViews.map { v in
            v.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        }
        profileBottomBorderedViews.map { v in
            v.layer.borderColor = UIColor(white: 233.0 / 255.0, alpha: 1.0).cgColor
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
