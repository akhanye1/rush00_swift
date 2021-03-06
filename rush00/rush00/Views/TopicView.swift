//
//  TopicView.swift
//  rush00
//
//  Created by Laura MAHLANGU on 2018/10/06.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import UIKit

class TopicView: UIViewController,UITableViewDataSource,UITableViewDelegate, UIDeligate {
    var apiAccess: String = ""
    var userAccess: String = ""

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logout: UIBarButtonItem!
    
    var passedData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopics(deligateType: self)
        // Do any additional setup after loading the view.
    }
    
    func updateMessages(messages: [Message]) {
        /*messageData = messages
        tableView.reloadData()*/
    }
    
    func updateTopics(topics: [Topic]) {
        topicData = topics
        tableView.reloadData()
    }
    
    func changeView(userKey: String) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell") as! TopicCell
        /*cell.textLabel?.text = topicData[indexPath.row].topic
        cell.detailTextLabel?.text = topicData[indexPath.row].date
        cell.detailTextLabel?.text = topicData[indexPath.row].author
        cell.detailTextLabel?.text = topicData[indexPath.row].id*/
        cell.topicLabel?.text = topicData[indexPath.row].topic
        cell.authorLabel?.text = topicData[indexPath.row].author
        cell.dateLabel?.text = topicData[indexPath.row].date
        cell.rowVal = topicData[indexPath.row].id
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let messageCell = segue.destination as? MessageViewController else { return }
        let cell = sender as! TopicCell
        messageCell.topicId = cell.rowVal!
        print("Row value is : ", messageCell.topicId!)
    }
    
    @IBAction func unwindToTopic(_ sender: UIStoryboardSegue){}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
