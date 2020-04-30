//
//  PoppedViewController.swift
//  Peek&Pop3DTouch
//
//  Created by Rahul Dubey on 6/14/17.
//

import UIKit

class PoppedViewController: UIViewController {

  @IBOutlet weak var poppedImageView: UIImageView!

  @IBOutlet weak var menuView: UIView!

  
  var previewImage = UIImage()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      poppedImageView.image = previewImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  //Preview Action Items: Override the preview action from the view controller
  override var previewActionItems: [UIPreviewActionItem] {
    let shareAction = UIPreviewAction(title: "Share", style: .default) { (action, viewController) -> Void in
      print("I wana share this Pic")
    }
    
    let trashAction = UIPreviewAction(title: "Trash", style: .destructive) { (action, viewController) -> Void in
      print("I trashed this Pic")
    }
    return [shareAction, trashAction]
  }

}
