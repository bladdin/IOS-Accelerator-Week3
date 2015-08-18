//
//  RepoSearchViewContoller.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/18/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class RepoSearchViewContoller: UITableViewController {

  @IBOutlet weak var searchBar: UISearchBar!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    searchBar.delegate = self
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RepoSearchViewContoller : UISearchBarDelegate{
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    GithubService.repositoriesForSearchTerm(searchBar.text)
  }
  
}
