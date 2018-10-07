//
//  Connection.swift
//  rush00
//
//  Created by Archiebald Katleho KHANYE on 2018/10/06.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import Foundation

/*func getTopics() {
    print("Started connection")
    let authEndPoint: String = "https://api.intra.42.fr/v2/messages?page[size]=5"

    let url = URL(string: authEndPoint)
    var request = URLRequest(url: url!)
    request.setValue("Bearer 78a7dff6955286a6d0f6cf90f7da6779b44bc68fe2a8e72809ce20b7b130d974", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    //request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
    //request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")  


    //request.httpBody = "grant_type=client_credentials&client_id=22c42f060036c0fb5c214c7d25776d31d0e39a1689160e0760757e2091d786e5&client_secret=cc9ada55bdd4bb842db82cdc8422ae6206388d8c0e6a5abe65b23941de177568".data(using: String.Encoding.utf8)
    //request.httpBody = "access_token=78a7dff6955286a6d0f6cf90f7da6779b44bc68fe2a8e72809ce20b7b130d974".data(using: String.Encoding.utf8)
    //request.httpBody = "page=5".data(using: String.Encoding.utf8)
    let session = URLSession.shared
    //var token:String = ""
    let requestPost = session.dataTask(with: request) { (data, response, error) in
        print("Received something")
        if let data = data {
            print(data)
            do {
                do {
                    let dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                    print("passed")
                }
                catch let error {
                    print("Error : \(error)")
                }

                /*if let tempToken = dictonary
                {
                    print(tempToken)
                    /*token = (tempToken["access_token"] as! String)
                    print(token)*/

                }
                else {
                    print("Did not work as expected")
                }*/
                
                var backToString = String(data: data, encoding: String.Encoding.utf8) as String!
                backToString = String(backToString!.dropFirst())
                backToString = String(backToString!.dropLast())
                //backToString = backToString.subStr(1, backToString.leng() - 1)
                
                if (!JSONSerialization.isValidJSONObject(backToString)) {
                    print("It is not json object")
                }
                else {
                    print("Can be converted to JSON")
                }
                print(backToString!)


            }catch let error {
                print(error)
            }
        }
        else {
            print("Data is null")
        }
    }
    requestPost.resume()
    sleep(5)
    //print(token)
    print("End token")
}*/

func getMessages() {
    print("Started connection")
    let authEndPoint: String = "https://api.intra.42.fr/v2/messages"

    let url = URL(string: authEndPoint)
    var request = URLRequest(url: url!)
    request.setValue("Bearer 6a05991d4d2be6a22afa3f55f4b85dd6b81fdd0a42aa071baae894944a673bbd", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    //request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
    //request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")  


    //request.httpBody = "grant_type=client_credentials&client_id=22c42f060036c0fb5c214c7d25776d31d0e39a1689160e0760757e2091d786e5&client_secret=cc9ada55bdd4bb842db82cdc8422ae6206388d8c0e6a5abe65b23941de177568".data(using: String.Encoding.utf8)
    //request.httpBody = "access_token=78a7dff6955286a6d0f6cf90f7da6779b44bc68fe2a8e72809ce20b7b130d974".data(using: String.Encoding.utf8)
    //request.httpBody = "page=5".data(using: String.Encoding.utf8)
    let session = URLSession.shared
    //var token:String = ""
    let requestPost = session.dataTask(with: request) { (data, response, error) in
        if let data = data {
            var backToString = String(data: data, encoding: String.Encoding.utf8) as String!
            do {
                if let dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,Any>] {
                    for oneMessage in dictonary {
                        if let tempMessage = oneMessage as? [String : Any] {
                            let messageId = tempMessage["id"] as! Int!
                            let topicId = tempMessage["messageable_id"] as! Int!
                            let messageDate = tempMessage["created_at"] as! String!
                            var author: String = "unKnown"
                            if let tempAuthor = tempMessage["author"] as? [String : Any] {
                                author = tempAuthor["login"] as! String!
                            }
                            let messageGiven = tempMessage["content"] as! String!
                            let isReply = tempMessage["is_root"] as! Bool!
                            /*print("Passed message : \(messageId)")*/
                            messageData.append(Message(id: "\(messageId)", message: messageGiven!, date: messageDate!, author: author, topicId: "\(topicId)",
        reply: isReply!))
                        }
                        else {
                            print("failed to read one message")
                        }
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
                
            }
        }
        else {
            print("Data is null")
        }
    }
    requestPost.resume()
    sleep(10)
    //print(token)
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
                    //print((tempToken["access_token"] as! String))
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
    sleep(2)
    print("End token")
}
