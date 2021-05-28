//
//  GetImageHelper.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 25/05/21.
//

import Foundation

class GetImageHelper {
    
    public static func fetchImage(from imageUrl: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: imageUrl)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Coul not fetch the image")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
        dataTask.resume()
    }
}
