//
//  SearchTableViewController.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/15/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, ActivityIndicatorProtocol {
  
  // MARK: Properties
  private let searchViewModel = SearchResultsViewModel()
  
  var activityIndicator = UIActivityIndicatorView()

  private var photos = [Photo]()
  
  //Search Controller
  lazy var searchController: UISearchController  = {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = PlaceHolders.search
    searchController.searchBar.delegate = self
    return searchController
  }()
  
  //NoData label it is presented when no data is available in the flicker Array
  lazy var welcomeMessageLabel: UILabel = {
    let rect = CGRect(x: 0, y: 0, width: tableView.bounds.size.width,
                      height: tableView.bounds.size.height)
    let welcomeMessageLabel: UILabel = UILabel(frame: rect)
    welcomeMessageLabel.text = Message.welcome
    welcomeMessageLabel.textColor = .black
    welcomeMessageLabel.textAlignment = .center
    return welcomeMessageLabel
  }()
  
  
  //MARK: View Life Cycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Set Up UserInterface
    setUpNavigationAndSearchBar()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: Private Functions
  
  private func setUpNavigationAndSearchBar() {
    navigationItem.searchController = searchController
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    definesPresentationContext = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: NavigationItemIdentifier.clear,
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(clearSearchResults))
  }

  private func show(alert message: String) {
    let alert = UIAlertController.init(title: Message.alert, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction.init(title: Message.ok, style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  ///MARK: - Button Action
  
  ///Clear Search Results and Reset the SearchResultsView
  @objc private func clearSearchResults() {
      photos = []
      tableView.reloadData()
      searchController.searchBar.text = nil
      searchController.searchBar.resignFirstResponder()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    //Reset Welcome Label if there is valid photos count.
    if photos.count > 0 {
      self.tableView.backgroundView = nil
      self.tableView.separatorStyle = .singleLine
      return 1
    }
    
    //Set Welcome Message Label
    self.tableView.backgroundView = welcomeMessageLabel
    self.tableView.separatorStyle = .none
    return 0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.searchResultsCell, for: indexPath) as! SearchResultsTableViewCell
    let photoObject = photos[indexPath.row]
    cell.setUp(flickrPhoto: photoObject)
    return cell
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    ///Launch the photo detail page with the selected photo
    performSegue(withIdentifier: SegueIdentifiers.photoSegue, sender: photos[indexPath.row])
  }

  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    //Guard the segue identifier else return 
    guard let segueId = segue.identifier else {
      return
    }
    
    switch segueId {
      
    case SegueIdentifiers.photoSegue:
      if let photoViewController = segue.destination as? PhotoViewController,
         let photo = sender as? Photo {
        photoViewController.setupdatePhoto(withPhotoObject: photo)
      }
    default:
      break
    }
  }
  
  // MARK - Deinitializer
  deinit {
    print("Denitialized SearchTableViewController")
  }
}

// MARK: - UISearchBarDelegate Delegate

extension SearchTableViewController:  UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
    //Dismiss the Keyboards
    searchBar.resignFirstResponder()
    
    //Show Loading Indicator with Medium Size
    showLoadingIndicator(withSize: CGSize.init(width: 80, height: 80))

    //Optional Bind search Text for valid search term
    guard let searchText = searchBar.text else {
      return
    }
    
    //Call the fetchFlickr from View Model
    searchViewModel.fetchFlickr(with: searchText) { [weak self] (labelText, photos) in
      guard let strongSelf = self else { return }
    
      ///Update the UI on the main queue
      DispatchQueue.main.async {
        
        //Remove the Activity Indicator once response is received
        strongSelf.removeLoadingIndicator()
        
        ///Update the Photo Array
        if let photosArray = photos {
          strongSelf.photos = photosArray
        }
        
        //Update the Label Text
        if let text = labelText {
          strongSelf.show(alert : text)
        }
        
        //Reload the tableView with new contents
        strongSelf.tableView.reloadData()
      }
    }
  }
}

