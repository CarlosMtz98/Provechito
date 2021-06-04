//
//  ProvechitoRouter.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 29/05/21.
//

import Foundation
import Alamofire

public enum ProvehitoRouter {
    case fetRecipeList
    case fetchRecipe(String)
    case fetchCategories
    case fetchCategory(String)
    
    enum Constants {
        static let baseUrlPath = "https://"
        static let authenticationToken = "Beare TOKEN"
    }
}
