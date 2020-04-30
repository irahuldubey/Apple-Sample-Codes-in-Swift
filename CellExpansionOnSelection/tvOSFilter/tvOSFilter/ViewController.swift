//
//  ViewController.swift
//  tvOSFilter
//
//  Created by Rahul Dubey on 1/13/17.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var isCellFocussed = false
  var indexPath: IndexPath?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    return cell
    
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if self.indexPath == indexPath {
      return CGSize(width: collectionView.frame.size.width, height: 300)
    }
    else{
      return CGSize(width: collectionView.frame.size.width, height: 60)
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
    
    if let cell = context.previouslyFocusedView as? UICollectionViewCell {
      
      coordinator.addCoordinatedAnimations({ () -> Void in
        if let currentIndex = collectionView.indexPath(for: cell) {
          UIView.animate(withDuration: 1.0, animations: {
            self.indexPath = currentIndex
            cell.backgroundColor = .green
            collectionView.collectionViewLayout.invalidateLayout()
          }, completion: { _ in
            }
          )}
      }, completion:{
      })
    }
    
    if let cell = context.nextFocusedView as? UICollectionViewCell {
      coordinator.addCoordinatedAnimations({ () -> Void in
        if let currentIndex = collectionView.indexPath(for: cell) {
          UIView.animate(withDuration: 1.0, animations: {
            self.indexPath = currentIndex
            cell.backgroundColor = .red
            collectionView.collectionViewLayout.invalidateLayout()
          }, completion: { _ in
          })
        }
      }, completion:{
      })
    }
  }
  
  var channelsLayout: UICollectionViewFlowLayout {
    return collectionView.collectionViewLayout as! UICollectionViewFlowLayout
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
