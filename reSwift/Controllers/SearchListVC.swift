//
//  SearchListVC.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 10/18/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class SearchListVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchListTV: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        //118,36,32
        searchBar.changeSearchBarColor(color: UIColor(red: 118/255, green: 36/255, blue: 32/255, alpha: 1))
        searchBar.changeSearchTextColor(color: .white)
        searchBar.clearBackground()
        
        searchListTV.delegate = self
        searchListTV.dataSource = self
        searchListTV.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
        segmentControl.sendActions(for: .valueChanged)
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as? SearchCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
