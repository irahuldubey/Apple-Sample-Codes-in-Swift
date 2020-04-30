//
//  ViewController.swift
//  Peek&Pop3DTouch
//
//  Created by Rahul Dubey on 6/14/17.
//


import UIKit

//View controller needs to conform to the Preview Delegate
class PeekViewController: UIViewController, UIViewControllerPreviewingDelegate {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Check if the platform is available for 3D touch
    if(traitCollection.forceTouchCapability == .available){
       //Source view should be the view on which we want the 3D touch in this case it would be imageView
       registerForPreviewing(with: self, sourceView: imageView)
       //We can call this above function multiple times for different views but cannot call multiple times for the same view
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: PEEK
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
    
    //Ge the view controller.
    guard let poppedViewController = storyboard?.instantiateViewController(withIdentifier: "PoppedViewController") as? PoppedViewController else {
      return nil
    }
    
    //Assign the image to the image property of the PoppedViewController
    poppedViewController.previewImage = imageView.image!
    //Get the content size you wana show the imageview
    poppedViewController.preferredContentSize = CGSize(width: 0.0, height: 500)
    //Source rect will be passed for the image view as we need to Peek Pop the image view
    previewingContext.sourceRect = self.view.frame
    //Return the popped view controller for the expected width and height
    return poppedViewController
  }
  
  //MARK: POP
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
      self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
  }
}


