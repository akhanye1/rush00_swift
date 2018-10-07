//
//  MessageViewController.swift
//  rush00
//
//  Created by Malebo MTHOMBENI on 2018/10/07.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIDeligate {
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    var topicId: String!
    
    func updateMessages(messages: [Message]) {
        messageData = messages
        tableView.reloadData()
    }
    
    func updateTopics(topics: [Topic]) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageTableViewCell
        /*let mssg: (String, String, String, String, String, Bool) = (messageData[indexPath.row].id, messageData[indexPath.row].message ,messageData[indexPath.row].date ,messageData[indexPath.row].author, messageData[indexPath.row].topicId, messageData[indexPath.row].reply)
        cell.messageD = mssg
//        cell.messageD = messageData[indexPath.row]*/
        cell.authorLabel?.text = messageData[indexPath.row].author
        cell.messageLabel?.text = messageData[indexPath.row].message
        cell.dateLabel?.text = messageData[indexPath.row].date
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMessages(deligateType: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
