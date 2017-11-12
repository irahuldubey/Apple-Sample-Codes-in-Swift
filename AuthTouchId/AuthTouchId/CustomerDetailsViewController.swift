//
//  CustomerDetailsViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ssn: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
  
    var customerDetails: CustomerDetailsViewModel?
    var customer: Customer!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      customerDetails = CustomerDetailsViewModel.init(withCustomer: customer)
    }
  
  private func getCustomerDetails() {
    customerDetails?.getCustomerDetails(completionHandler: { (cust) in
      DispatchQueue.main.async {
        self.name.text = cust?.name
        self.ssn.text = cust?.ssn
        self.address.text = cust?.address
        self.phoneNumber.text = cust?.phoneNumber
        self.email.text = cust?.email
      }
    })
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
