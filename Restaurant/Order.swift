//
//  Order.swift
//  Restaurant
//
//  Created by nhp on 9/3/19.
//  Copyright © 2019 nhp. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
