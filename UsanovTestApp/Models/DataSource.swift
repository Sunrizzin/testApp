//
//  DataSource.swift
//  UsanovTestApp
//
//  Created by Алексей Усанов on 06.07.2020.
//  Copyright © 2020 Алексей Усанов. All rights reserved.
//

import Foundation
import UIKit


class DataManager {
    private var country: [CountryViewModel.Countries] = []
    
    public func get(url: String, _ callback: @escaping (Bool) -> Void) {
        guard let gitUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(CountryViewModel.self, from: data)
                self.country.append(contentsOf: data.countries)
                if !data.next.isEmpty {
                    self.get(url: data.next) { (_) in
                        callback(true)
                    }
                }
                callback(true)
            } catch let err {
                print("Err", err)
            }
        }.resume()
    }
    
    public var itemsCount: Int {
        return country.count
    }
    
    public func item(at index: Int) -> CountryViewModel.Countries {
        return country[index]
    }
}

class DataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        let item = dataManager.item(at: indexPath.row)
        cell.config(with: item)
        return cell
    }
}
