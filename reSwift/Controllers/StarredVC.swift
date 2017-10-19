//
//  StarredVC.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 10/18/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class StarredVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchListTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //118,36,32
        searchBar.changeSearchBarColor(color: UIColor(red: 118/255, green: 36/255, blue: 32/255, alpha: 1))
        searchBar.changeSearchTextColor(color: .white)
        searchBar.clearBackground()
        
        searchListTV.delegate = self
        searchListTV.dataSource = self
        searchListTV.register(UINib(nibName: "StaredCell", bundle: nil), forCellReuseIdentifier: "StaredCell")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StaredCell") as? StaredCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
