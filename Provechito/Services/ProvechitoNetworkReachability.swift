//
//  ProvechitoNetworkReachability.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 29/05/21.
//

import Foundation
import UIKit

class ProvechitoNetworkReachability {
    static let shared = ProvechitoNetworkReachability()
    
    let offlineAlertController: UIAlertController = {
        UIAlertController(title: "No Network", message: "Please connect to network and try again", preferredStyle: .alert)
    }()
    
    func showOfflineAlert() {
      let rootViewController = UIApplication.shared.windows.first?.rootViewController
      rootViewController?.present(offlineAlertController, animated: true, completion: nil)
    }

    func dismissOfflineAlert() {
      let rootViewController = UIApplication.shared.windows.first?.rootViewController
      rootViewController?.dismiss(animated: true, completion: nil)
    }
}
