//
//  ViewController.swift
//  poq_CatalinPalade_Challenge
//
//  Created by Catalin Palade on 24/11/2019.
//  Copyright © 2019 Catalin Palade. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    let API_link = "https://api.github.com/orgs/square/repos"
    let networkingClient = NetworkingClient()
    
    // IBOutlets
    // table view - delegate and data source set in storyboard
    // table view cell identifier set in storyboard as "cell"
    @IBOutlet weak var tableView: UITableView!
    
    var repos: [Repo] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRepos()
    }

    fileprivate func getRepos() {
        guard let url = URL(string: API_link) else { return }
        
        networkingClient.execute(url: url) { (json, error) in
            if let error = error {
                UIAlertController.showAlertWithOKButton(view: self, title: "Error", message: error.localizedDescription)
            } else {
                json?.forEach({ (item) in
                    if let repo = Repo(json: item) {
                        self.repos.append(repo)
                    }
                })
            }
        }
    }

}

// MARK: UITableView
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let repo = repos[indexPath.row]
        cell.textLabel?.text = repo.name
        cell.detailTextLabel?.text = repo.description
        
        return cell
    }
}

