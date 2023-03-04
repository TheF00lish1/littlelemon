//
//  MenuItem.swift
//  Little Lemon
//
//  Created by David Duprez-Goulet on 2023-03-01.
//

import Foundation

struct MenuItem: Codable, Identifiable{
    let title : String
    let image : String
    let price : String
    let id: Int
}

