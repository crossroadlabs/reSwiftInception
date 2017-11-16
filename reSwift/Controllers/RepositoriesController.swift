//
//  RepositoriesController.swift
//  reSwift
//
//  Created by Ruslan Yupyn on 10/17/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class RepositoriesController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var bordersViews: [UIView]!
    @IBOutlet weak var startgazersCount: UILabel!
    @IBOutlet weak var watchersCount: UILabel!
    @IBOutlet weak var forksCount: UILabel!
    @IBOutlet weak var publicLabel: UILabel!
    @IBOutlet weak var boxesLabel: UILabel!
    @IBOutlet weak var issuesCountLabel: UILabel!
    @IBOutlet weak var branchesCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var ovnersLabel: UILabel!
    @IBOutlet weak var eventsLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    
    @IBOutlet weak var eventsBtn: UIButton!
    @IBOutlet weak var ownersBtn: UIButton!
    @IBOutlet weak var issuesBtn: UIButton!
    
    @IBOutlet var bottomBordersViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImage.layer.borderColor = UIColor.white.cgColor
        for view in bordersViews {
            view.layer.borderColor = UIColor(white: 1.0, alpha: 0.12).cgColor
        }
        for view in bottomBordersViews {
            view.layer.borderColor = UIColor(white: 223.0 / 255.0, alpha: 1.0).cgColor
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ownersAction(_ sender: UIButton) {
        if let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC {
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
    }
    
    @IBAction func eventsAction(_ sender: UIButton) {
        if let eventsVC = UIStoryboard(name: "StarredVC", bundle: nil).instantiateViewController(withIdentifier: "StarredVC") as? StarredVC {
            eventsVC.titleText = "Events"
            eventsVC.dataType = .events
            self.navigationController?.pushViewController(eventsVC, animated: true)
        }
    }
    
    @IBAction func issuesAction(_ sender: UIButton) {
        if let issuesVC = UIStoryboard(name: "StarredVC", bundle: nil).instantiateViewController(withIdentifier: "StarredVC") as? StarredVC {
            issuesVC.titleText = "Issues"
            issuesVC.dataType = .issues
            self.navigationController?.pushViewController(issuesVC, animated: true)
        }
    }
}
