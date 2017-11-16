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
    @IBOutlet weak var repoBtn: UIButton!
    @IBOutlet weak var eventsBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet var profileTopBorderedViews: [UIView]!
    @IBOutlet var profileBottomBorderedViews: [UIView]!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileTopBorderedViews.forEach { v in
            v.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
        }
        profileBottomBorderedViews.forEach { v in
            v.layer.borderColor = UIColor(white: 233.0 / 255.0, alpha: 1.0).cgColor
        }
        
        repoBtn.addTarget(self, action: #selector(repoAction), for: .touchUpInside)
        eventsBtn.addTarget(self, action: #selector(eventsAction), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let isRootController = self.navigationController?.viewControllers.count ?? 0
        let isNeedToHide = (isRootController) > 1 ? false : true
        backBtn.isHidden = isNeedToHide
        logoutButton.isHidden = !isNeedToHide
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func repoAction(_ sender: UIButton) {
        if let reposVC = UIStoryboard(name: "StarredVC", bundle: nil).instantiateViewController(withIdentifier: "StarredVC") as? StarredVC {
            reposVC.titleText = "Repositories"
            reposVC.dataType = .repositories
            self.navigationController?.pushViewController(reposVC, animated: true)
        }
    }
    
    @objc func eventsAction(_ sender: UIButton) {
        if let eventsVC = UIStoryboard(name: "StarredVC", bundle: nil).instantiateViewController(withIdentifier: "StarredVC") as? StarredVC {
            eventsVC.titleText = "Events"
            eventsVC.dataType = .events
            self.navigationController?.pushViewController(eventsVC, animated: true)
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        tabBarController?.dismiss(animated: true, completion: nil)
    }
}
