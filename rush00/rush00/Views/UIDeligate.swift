//
//  UIDeligate.swift
//  rush00
//
//  Created by Archiebald Katleho KHANYE on 2018/10/07.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import Foundation

protocol UIDeligate : class {
    func updateMessages(messages: [Message])
    func updateTopics(topics: [Topic])
    func changeView(userKey: String)
}
