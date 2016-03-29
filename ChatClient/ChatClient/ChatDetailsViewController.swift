//
//  ChatDetailsViewController.swift
//  ChatClient
//
//  Created by Prasanthi Relangi on 3/28/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatDetailsViewController: JSQMessagesViewController {

    @IBOutlet weak var tableView: UITableView!
    var messages = [JSQMessage]()
    var avatars: [JSQMessagesAvatarImage] = []
    
    
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Chat Details"
        
        self.senderId = "Prasanthi"
        self.senderDisplayName = "Prasu"
        
        //Set up bubbles for incoming and outgoing messages
        setupBubbles()
        setupAvatars()
        
        //Set up dummy conversation
        addMessages(self.senderId, displayName: self.senderDisplayName, text: "Let's get a drink ? 🍹")
        addMessages("Aswani", displayName: "Achhi", text: "Sure :)")
        addMessages(self.senderId, displayName: self.senderDisplayName, text: "Let's go :)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupBubbles() {
        let bubbleImageFactory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = bubbleImageFactory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
        incomingBubbleImageView = bubbleImageFactory.incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleRedColor())
    }
    
    private func setupAvatars() {
        let aswaniImage = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "CircledUserMale-50"), diameter: 50)
        let prasanthiImage = JSQMessagesAvatarImageFactory.avatarImageWithImage(UIImage(named: "CircledUserFemale-50"), diameter: 50)
        avatars.append(aswaniImage)
        avatars.append(prasanthiImage)
    }
    
    func addMessages(senderId: String, displayName: String, text: String) {
        let message = JSQMessage(senderId: senderId, displayName: displayName, text: text)
        messages.append(message)
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item]
        if message.senderId == senderId {
            return outgoingBubbleImageView
        } else {
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let message = messages[indexPath.row]
        if message.senderId == "Aswani" {
            return avatars[0]
        }
        else {
            return avatars[1]
        }
    }
    
    //Also need to add height for cell
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        
        let message = messages[indexPath.row]
        if message.senderId == "Aswani" {
            let attributedStringColour = [NSForegroundColorAttributeName : UIColor.blueColor()];
            let senderName = NSAttributedString(string: "Aswani Nerella",attributes: attributedStringColour)
            return senderName
        }
        else {
            return nil
        }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 20
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


