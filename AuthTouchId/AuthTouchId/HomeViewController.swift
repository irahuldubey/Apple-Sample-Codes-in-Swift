//
//  HomeViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/1/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var welcomeLabel: UILabel!
  @IBOutlet weak var approvalsButton: UIButton!
  @IBOutlet weak var approvedButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!

  var images: [UIImage] = [UIImage]()
  var username: String?
  var customer: Customer?
  var transactions: [TransactionDetails] = [TransactionDetails]()
  var popups: [CNPPopupController] = [CNPPopupController]()
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let username = username {
      welcomeLabel.text = "Welcome \(username)"
    }
    
    images = [
      UIImage.init(named: "Card2")!,
      UIImage.init(named: "Card3")!,
      UIImage.init(named: "Card5")!
    ]
    
    let transation1 = TransactionDetails.init(withFirstString: "Sept 16, 2017", secondString: "Main Street Hotel", andAmount: "$103.70")
    let transation2 = TransactionDetails.init(withFirstString: "Sept 18, 2017", secondString: "Starbucks", andAmount: "$13.20")
    let transation3 = TransactionDetails.init(withFirstString: "Sept 19, 2017", secondString: "Thai Terrace", andAmount: "$73.87")
    let transation4 = TransactionDetails.init(withFirstString: "Sept 20, 2017", secondString: "Card Cash", andAmount: "$100.99")
    let transation5 = TransactionDetails.init(withFirstString: "Sept 25, 2017", secondString: "Auto Parts", andAmount: "$803.00")
    let transation6 = TransactionDetails.init(withFirstString: "Sept 28, 2017", secondString: "Gift Card", andAmount: "$50.66")
    let transation7 = TransactionDetails.init(withFirstString: "Sept 29, 2017", secondString: "Business Gift", andAmount: "$100.50")
    let transation8 = TransactionDetails.init(withFirstString: "Sept 30, 2017", secondString: "Amazon Payments", andAmount: "$77.04")
    let transation9 = TransactionDetails.init(withFirstString: "Oct 1, 2017", secondString: "CVS", andAmount: "$90.03")
    let transation10 = TransactionDetails.init(withFirstString: "Oct 8, 2017", secondString: "Electronic Payment", andAmount: "$87.11")
    
    transactions = [transation1, transation2, transation3, transation4, transation5, transation6, transation7, transation8, transation9, transation10]
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.approvalsButton.isHidden = false
    self.approvedButton.isHidden = true
  }
    
  @IBAction func userDetails(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier :"CustomerDetailsViewControllerId") as! CustomerDetailsViewController
    if let customer = customer{
      viewController.customer = customer
    }
    viewController.modalTransitionStyle = .flipHorizontal
    self.present(viewController, animated: true)
  }
  
  
  deinit {
    print("Deinitialized Home View Controller")
  }
  
  @IBAction func retrieveUserInfo(_ sender: Any) {
    
    if (sender as! UIButton).tag == 1 {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier :"ApprovedCreditCardsViewControllerSotryboardIdentifier") as! ApprovedCreditCardsViewController
      viewController.modalPresentationStyle = .overCurrentContext
      self.present(viewController, animated: true)
    }
      //Approvals: Get instant approvals
    else{
      
      KeychainItem.sharedInstance.retrieveValueFromKeychain { (success) in
      
        if success {
          
          DispatchQueue.main.async {
            let alert = UIAlertController(title: "Confirmation",
                                          message: "We will prcoess your info using Bio Profile, Are you sure you want to see approved card?",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "NO", style: .default, handler: nil)
            alert.addAction(action)
            
            let action2 = UIAlertAction.init(title: "YES", style: .default, handler: { (action) in
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let viewController = storyboard.instantiateViewController(withIdentifier :"CardApprovalViewController") as! CardApprovalViewController
              viewController.modalPresentationStyle = .overCurrentContext
              self.present(viewController, animated: true)
              self.view.alpha = 0.4
              
              self.approvalsButton.isHidden = true
              self.approvedButton.isHidden = false
            })
            alert.addAction(action2)
            self.present(alert, animated: true, completion: nil)
          }
          
         
        }
        else{
          DispatchQueue.main.async {
            let alert = UIAlertController(title: "Authenticated Failed",
                                          message: "Looks like you have not set up your touch Id",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
          }
        }
      }
    }
  }
  
  @IBAction func switchViewController(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier :"CustomerDetailsViewControllerId") as! CustomerDetailsViewController
    viewController.modalTransitionStyle = .flipHorizontal
    self.present(viewController, animated: true)
  }
}

extension HomeViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return transactions.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomTransactionCellCollectionViewCell
    
      cell.label1.text = transactions[indexPath.row].firstString
      cell.label2.text = transactions[indexPath.row].secondSring
      cell.label3.text = transactions[indexPath.row].amount
    
    return cell
  }
}
