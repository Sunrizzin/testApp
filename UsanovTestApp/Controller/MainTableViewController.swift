//
//  TableViewController.swift
//  UsanovTestApp
//
//  Created by Алексей Усанов on 05.07.2020.
//  Copyright © 2020 Алексей Усанов. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var dataManager = DataManager()
    private lazy var dataSourceProvider = DataSource(dataManager: dataManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.get(url: "https://rawgit.com/NikitaAsabin/799e4502c9fc3e0ea7af439b2dfd88fa/raw/7f5c6c66358501f72fada21e04d75f64474a7888/page1.json") { (state) in
            if state {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        tableView.dataSource = dataSourceProvider
        tableView.delegate = dataSourceProvider
    }
}
