//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by nhp on 9/3/19.
//  Copyright © 2019 nhp. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
