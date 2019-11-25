//
//  ExtensionUIAlertController.swift
//  poq_CatalinPalade_Challenge
//
//  Created by Catalin Palade on 24/11/2019.
//  Copyright © 2019 Catalin Palade. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func showAlertWithOKButton(view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
}
