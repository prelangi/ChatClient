//
//  UserContactsViewController.swift
//  ChatClient
//
//  Created by Prasanthi Relangi on 4/26/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit
import ContactsUI

//class UserContactsViewController: UIViewController,CNContactPickerDelegate {
class UserContactsViewController: CNContactPickerViewController,CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("In viewDidLoad method")
        
//        let contactPicker = CNContactPickerViewController()
//        contactPicker.delegate = self
//        self.tabBarController?.presentViewController(contactPicker, animated: true, completion: nil)
//        //AppDelegate.getAppDelegate().tabBarController.presentViewController(contactPicker, animated: true, completion: nil)
        
        self.delegate = self
        
        

    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        print("In viewWillAppear method")
//        let contactPicker = CNContactPickerViewController()
//        contactPicker.delegate = self
//        self.tabBarController?.presentViewController(contactPicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        print("Selected contact with name: \(contact.givenName)")
        showContactDetailView(contact.givenName)
    }

    func showContactDetailView(contactGivenName:String) {
        let contactDetailsStoryboard = UIStoryboard(name: "ContactDetails", bundle: nil)
        let contactDetailsViewController = contactDetailsStoryboard.instantiateViewControllerWithIdentifier("contactDetailsViewController") as! UserContactDetailsViewController
        contactDetailsViewController.contactName = contactGivenName
        //contactDetailsViewController.hidesBottomBarWhenPushed = true
        dismissViewControllerAnimated(true) { () -> Void in
            self.navigationController?.pushViewController(contactDetailsViewController, animated: false)
        }
        
        
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
