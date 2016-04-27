//
//  UserContactDetailsViewController.swift
//  ChatClient
//
//  Created by Prasanthi Relangi on 4/26/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class UserContactDetailsViewController: UIViewController {

    @IBOutlet weak var contactGivenName: UILabel!
    var contactName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactGivenName.text = contactName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
