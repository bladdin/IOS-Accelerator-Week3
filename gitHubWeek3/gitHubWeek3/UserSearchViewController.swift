//
//  UserSearchViewController.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/21/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {

  @IBOutlet weak var userSearchCollectionView: UICollectionView!
  
  @IBOutlet weak var searchBarUserController: UISearchBar!
  
  let imageQueue = NSOperationQueue()
  
  var users = [User]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      searchBarUserController.delegate = self
      userSearchCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserSearchViewController : UISearchBarDelegate{
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
    GithubService.userForSearchTerm(searchBar.text, userSearchCallback: { (errorDescription, users) -> (Void) in
      if let error = errorDescription{
        
      }else if let users = users {
        self.users = users
        self.userSearchCollectionView.reloadData()
        
      }
    })
  }
  func searchBar(searchBar : UISearchBar, shouldChangetextinRange range : NSRange, replacementText text: String) -> Bool{
    return text.validateForURL()
  }
}

extension UserSearchViewController : UICollectionViewDataSource{
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UserCell", forIndexPath: indexPath) as! UserCell
    
    cell.avatarImageView.image = nil
    cell.hidden = false
    cell.alpha = 0
    
    cell.tag++
    let tag = cell.tag
    
    var user = users[indexPath.row]
    
    if let image = user.image {
      cell.avatarImageView.image = image
    } else {
      
      ImageService.fetchProfileImage(user.avatarId, imageQueue: imageQueue, completionHandler: { (image) -> () in
        user.image = image
        self.users[indexPath.row] = user
        if cell.tag == tag {
          cell.avatarImageView.image = user.image
          
          UIView.animateWithDuration(0.5, animations: { () -> Void in
            cell.alpha = 1
          })
        }
      })
    }
    return cell
  }
}

extension UserSearchViewController : UINavigationControllerDelegate {
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    
    return toVC is UserDetailViewController ? ToUserDetailAnimationController() : nil
  }
}