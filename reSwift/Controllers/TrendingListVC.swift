//
//  TrendingListVC.swift
//  reSwift
//
//  Created by Roman Stolyarchuk on 10/16/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class TrendingListVC: UIViewController {
    
    @IBOutlet weak var languagesBtn: UIButton!
    @IBOutlet weak var segmentFilter: UISegmentedControl!
    @IBOutlet weak var trendingTV: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTV.delegate = self
        trendingTV.dataSource = self
        trendingTV.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
        segmentFilter.sendActions(for: .valueChanged)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func segmentedControlAction(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
            print("DAILY")
        }
        else if(sender.selectedSegmentIndex == 1)
        {
            print("WEEKLY")
        }
        else if(sender.selectedSegmentIndex == 2)
        {
            print("MONTHLY")
        }
    }
    
    @IBAction func languageBtnAction(sender: UIButton) {
        print("Language button pressed")
    }
}

extension TrendingListVC: UITableViewDelegate,UITableViewDataSource {
    
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
        if let repoVC = UIStoryboard(name: "Repositories", bundle: nil).instantiateViewController(withIdentifier: "RepositoriesController") as? RepositoriesController {
         self.navigationController?.pushViewController(repoVC, animated: true)
        }
    }
}
