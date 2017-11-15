//
//  SearchListVC.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 10/18/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class SearchListVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchListTV: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var hideKeyboardButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //118,36,32
        searchBar.changeSearchBarColor(color: UIColor(red: 118/255, green: 36/255, blue: 32/255, alpha: 1))
        searchBar.changeSearchTextColor(color: .white)
        searchBar.clearBackground()
        
        searchListTV.delegate = self
        searchListTV.dataSource = self
        searchListTV.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        searchListTV.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        segmentControl.sendActions(for: .valueChanged)
        
        hideKeyboardButton.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func segmentedControlAction(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
            print("Repositories")
        }
        else if(sender.selectedSegmentIndex == 1)
        {
            print("Users")
        }
        searchListTV.reloadData()
    }
    
    @IBAction func hideButton(sender: UIButton) {
        view.endEditing(true)
        hideKeyboardButton.isHidden = true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        hideKeyboardButton.isHidden = false
    }
}

extension SearchListVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentControl.selectedSegmentIndex == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as? SearchCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentControl.selectedSegmentIndex == 0 {
            if let repoVC = UIStoryboard(name: "Repositories", bundle: nil).instantiateViewController(withIdentifier: "RepositoriesController") as? RepositoriesController {
                self.navigationController?.pushViewController(repoVC, animated: true)
            }
        } else {
            if let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC {
                self.navigationController?.pushViewController(profileVC, animated: true)
            }
        }
        
    }
}
