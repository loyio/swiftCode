//
//  Restaurant.swift
//  FoodPin
//
//  Created by Loyio on 2/19/21.
//

import Foundation

struct Restaurant: Hashable {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isFavorite: Bool = false
}
