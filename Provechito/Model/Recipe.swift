//
//  Recipe.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 25/05/21.
//

import Foundation


struct Recipe {
    var id: String
    var name: String
    var duration: Int
    var category: String
    var thumbnailUrl: String?
    var images: [String]?
}
