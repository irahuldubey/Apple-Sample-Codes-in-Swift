//
//  ContainerViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController  {
  
  @IBOutlet weak var customLabel: UILabel!
  @IBOutlet weak var cardsViewCarousel: iCarousel!
  var animatedView: NVActivityIndicatorView!

  var images: [UIImage] = [UIImage]()

  override func viewDidLoad() {
    super.viewDidLoad()
   
    self.cardsViewCarousel.isHidden = true
    
    images = [
      UIImage.init(named: "Card2")!,
      UIImage.init(named: "Card3")!,
      UIImage.init(named: "Card5")!
    ]
    
    cardsViewCarousel.delegate = self
    cardsViewCarousel.dataSource = self
    cardsViewCarousel.type = .linear
    
    animatedView = NVActivityIndicatorView.init(frame: CGRect.init(x: view.center.x - 30,
                                                                   y: view.center.y - 50,
                                                                   width: 50,
                                                                   height: 50))
    view.addSubview(animatedView)
    
    animatedView.startAnimating()
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.customLabel.text = "You have been approved for below cards"
      self.animatedView.stopAnimating()
      self.cardsViewCarousel.reloadData()
      self.cardsViewCarousel.isHidden = false
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}


extension ContainerViewController: iCarouselDataSource, iCarouselDelegate {

  func numberOfItems(in carousel: iCarousel) -> Int {
    return images.count
  }

  func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {

    let frame = CGRect.init(x: 0, y: 0, width: 150, height: 150)

    //Create UIImageView
    let tempView = UIView(frame: frame)
    tempView.backgroundColor = UIColor.darkGray
    let imageView = UIImageView()
    imageView.frame = frame
    imageView.contentMode = .scaleAspectFit
    imageView.image = images[index]
    tempView.addSubview(imageView)

    return tempView
  }

  func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
    if option == iCarouselOption.spacing {
      return value * 1.2
    }
    return value
  }
}
