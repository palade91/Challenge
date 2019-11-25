//
//  Repo.swift
//  poq_CatalinPalade_Challenge
//
//  Created by Catalin Palade on 24/11/2019.
//  Copyright © 2019 Catalin Palade. All rights reserved.
//

import Foundation

class Repo {
    
    let name: String
    let description: String
    
    required init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    convenience init?(json: [String: Any]) {
        let name = json["name"] as? String ?? ""
        let description = json["description"] as? String ?? ""
        
        self.init(name: name, description: description)
    }
}
