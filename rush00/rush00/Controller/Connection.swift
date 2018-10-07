//
//  Connection.swift
//  rush00
//
//  Created by Archiebald Katleho KHANYE on 2018/10/06.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import Foundation

weak var deligate: UIDeligate?

var updateArray: [Message] = [Message]()
var updateTopics: [Topic] = [Topic]()
let tokenKey: String? = "6d09c621936fcf6f591b16bc10f80b6bb48f243e0222783bedfbfd200fa87b85"

func getTopics(deligateType: UIDeligate) {
    deligate = deligateType
    print("Started connection")
    let authEndPoint: String = "https://api.intra.42.fr/v2/cursus_topics"

    let url = URL(string: authEndPoint)
    var request = URLRequest(url: url!)
    request.setValue("Bearer 3504fa94bbd9f3e6c4a2062d92b86d6b1ae344f35a29f696a7c14da9ec57b152", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    let session = URLSession.shared
    let requestPost = session.dataTask(with: request) { (data, response, error) in
        if let data = data {
            var backToString = String(data: data, encoding: String.Encoding.utf8) as String!
            print(backToString)
            do {
                var backToString = String(data: data, encoding: String.Encoding.utf8) as String!
                if let dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,Any>] {
                    for oneMessage in dictonary {
                        let messageId = oneMessage["id"] as! Int?
                        var author: String = "unKnown"
                        var message: String = "."
                        var messageDate: String = ""
                        if let tempAuthor = oneMessage["topic"] as? [String : Any] {
                            messageDate = tempAuthor["created_at"] as! String!
                            message = tempAuthor["name"] as! String!
                            if let tempPerson = tempAuthor["author"] as? [String : Any] {
                                author = tempPerson["login"] as! String!
                            }
                        }
                        updateTopics.append(Topic(id: "\(messageId)", topic: message, date: messageDate, author: author))
                    }
                }
                else {
                    print("Dictionary is empty")
                }
            } catch let error {
                print(error)
            }
            print("Done loading data")
            DispatchQueue.main.async {
                deligate!.updateTopics(topics: updateTopics)
            }
        }
        else {
            print("Data is null")
        }
    }
    requestPost.resume()
    //print(token)
    print("End token")
}

func getMessages(deligateType: UIDeligate) {
    deligate = deligateType
    print("Started connection")
    let authEndPoint: String = "https://api.intra.42.fr/v2/messages"

    let url = URL(string: authEndPoint)
    var request = URLRequest(url: url!)
    request.setValue("Bearer 3504fa94bbd9f3e6c4a2062d92b86d6b1ae344f35a29f696a7c14da9ec57b152", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    let session = URLSession.shared
    let requestPost = session.dataTask(with: request) { (data, response, error) in
        if let data = data {
            do {
                if let dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,Any>] {
                    for oneMessage in dictonary {
                        let messageId = oneMessage["id"] as! Int?
                        let topicId = oneMessage["messageable_id"] as! Int?
                        let messageDate = oneMessage["created_at"] as! String?
                        var author: String = "unKnown"
                        if let tempAuthor = oneMessage["author"] as? [String : Any] {
                            author = tempAuthor["login"] as! String!
                        }
                        let messageGiven = oneMessage["content"] as! String?
                        let isReply = oneMessage["is_root"] as! Bool?
                        updateArray.append(Message(id: "\(messageId)", message: messageGiven!, date: messageDate!, author: author, topicId: "\(topicId)",
    reply: isReply!))
                        
                    }
                }
                else {
                    print("Dictionary is empty")
                }
            } catch let error {
                print(error)
            }
            print("Done loading data")
            DispatchQueue.main.async {
                deligate!.updateMessages(messages: updateArray)
            }
        }
        else {
            print("Data is null")
        }
    }
    requestPost.resume()
    print("End token")
}


func getTokenKey() {
    print("Started connection")
    let authEndPoint: String = "https://api.intra.42.fr/oauth/token"

    let url = URL(string: authEndPoint)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.httpBody = "grant_type=client_credentials&client_id=22c42f060036c0fb5c214c7d25776d31d0e39a1689160e0760757e2091d786e5&client_secret=cc9ada55bdd4bb842db82cdc8422ae6206388d8c0e6a5abe65b23941de177568".data(using: String.Encoding.utf8)
    let session = URLSession.shared
    let requestPost = session.dataTask(with: request) { (data, response, error) in
        print("Received something")
        if let data = data {
            print(data)
            do {
                let dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                print("passed")
                if (dictonary == nil) {
                    print("Dictionary is nil")
                    return
                }
                if let tempToken = dictonary
                {
                    print(tempToken)
                    //tokenKey = tempToken["access_token"] as! String!
                }
                else {
                    print("Did not work as expected")
                }                
            }catch let error {
                print(error)
            }
        }
        else {
            print("Data is null")
        }
    }
    requestPost.resume()
    print("End token")
}
