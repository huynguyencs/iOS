//
//  DetailViewController.swift
//  UsersProfile
//
//  Created by Thanh Hoang on 11/23/15.
//  Copyright © 2015 Thanh Hoang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        var user: User
        // Update the user interface for the detail item.
        user = self.detailItem as! User
        
        if let label1 = self.firstNameLabel {
            label1.text = user.getFirstName()
        }
        
        if let label2 = self.lastNameLabel {
            label2.text = user.getLastName()
        }
        
        if let label3 = self.phoneNumberLabel {
            label3.text = user.getPhoneNumber()
        }
        
        if let label4 = self.addressLabel {
            label4.text = user.getAddress()
        }
        
        //        if let user = self.detailItem {
        //            if let label = self.detailDescriptionLabel {
        //                label.text = user.
        //            }
        //        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



