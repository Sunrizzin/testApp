//
//  CountryTableViewCell.swift
//  UsanovTestApp
//
//  Created by Алексей Усанов on 05.07.2020.
//  Copyright © 2020 Алексей Усанов. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    func config(with country: CountryViewModel.Countries) {
        capitalLabel.text = country.capital
        nameLabel.text = country.name
        discriptionLabel.text = country.description_small
        ImageLoader().obtainImageWithPath(imagePath: country.country_info.flag) { (image) in
            self.flagImageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
