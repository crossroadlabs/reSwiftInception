//
//  StarredVC.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 10/18/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

enum VCType {
    case starred
    case repositories
    case events
}

class StarredVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchListTV: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var searchBarViewHeight: NSLayoutConstraint!
    
    var titleText = "Stared"
    var dataType = VCType.starred
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.changeSearchBarColor(color: UIColor(red: 118/255, green: 36/255, blue: 32/255, alpha: 1))
        searchBar.changeSearchTextColor(color: .white)
        searchBar.clearBackground()
        
        searchListTV.delegate = self
        searchListTV.dataSource = self
        searchListTV.register(UINib(nibName: "StaredCell", bundle: nil), forCellReuseIdentifier: "StaredCell")
        searchListTV.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        searchListTV.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLbl.text = titleText
        backBtn.isHidden = dataType == .starred ? true : false
        switch dataType {
            case .events:
                searchBar.isHidden = true
                searchBarViewHeight.constant = 0
            default:
                searchBar.isHidden = false
                searchBarViewHeight.constant = 40
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension StarredVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataType {
            case .starred:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "StaredCell") as? StaredCell {
                    return cell
                }
            case .events:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell {
                    cell.userNameLbl.text = "User starred other user"
                    cell.userNameLbl.textColor = .darkGray
                    
                    return cell
                }
            case .repositories:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as? SearchCell {
                    return cell
                }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch dataType {
            case .starred: break
            case .events: break
            case .repositories:
                if let repoVC = UIStoryboard(name: "Repositories", bundle: nil).instantiateViewController(withIdentifier: "RepositoriesController") as? RepositoriesController {
                    self.navigationController?.pushViewController(repoVC, animated: true)
            }
        }
    }
}
