//
//  ViewController.swift
//  GridCollectionView
//
//  Created by Rahul Dubey on 2/14/17.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var parentCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParentCell", for: indexPath) as! ParentCollectionViewCell
    cell.backgroundColor = .red
    return cell
    
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
 
}

