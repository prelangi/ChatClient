//
//  ChatsViewController.swift
//  ChatClient
//
//  Created by Prasanthi Relangi on 3/27/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register tableView cell xib
        let chatNib = UINib(nibName: "ChatCell", bundle: nil)
        tableView.registerNib(chatNib, forCellReuseIdentifier: "ChatCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
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

extension ChatsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChatCell", forIndexPath: indexPath) as! ChatCell
        
        let row = indexPath.row
        
        
        if row%2 == 0 {
            cell.profileImageView.image = UIImage(named:"CircledUserFemale-50")
            cell.nameLabel.text = "Prasu"
            cell.dateLabel.text = "10:30 PM"
            cell.messageLabel.text = "Hello ... "
        }
        else {
            cell.profileImageView.image = UIImage(named:"CircledUserMale-50")
            cell.nameLabel.text = "Aswani"
            cell.dateLabel.text = "9:30 PM"
            cell.messageLabel.text = "Hi"
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        showChatDetailView()
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func showChatDetailView() {
        let chatDetailsStoryboard = UIStoryboard(name: "ChatDetails", bundle: nil)
        let chatDetailsViewController = chatDetailsStoryboard.instantiateViewControllerWithIdentifier("chatDetailsViewController") as! ChatDetailsViewController
        chatDetailsViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatDetailsViewController, animated: false)
        
    }
    
}
