//
//  Countries.swift
//  UsanovTestApp
//
//  Created by Алексей Усанов on 05.07.2020.
//  Copyright © 2020 Алексей Усанов. All rights reserved.
//

import Foundation

struct CountryViewModel: Codable {
    struct Countries: Codable {
        struct CountryInfo: Codable  {
            let images: [String]
            let flag: String
        }
        let country_info: CountryInfo
        let name: String
        let continent: String
        let capital: String
        let population: Int
        let description_small: String
        let description: String
        let image: String
    }
    let next: String
    let countries: [Countries]
}
