//
//  MessageTableViewCell.swift
//  rush00
//
//  Created by Malebo MTHOMBENI on 2018/10/06.
//  Copyright © 2018 Archiebald Katleho KHANYE. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!


    var messageD: (String, String, String, String, String, Bool)? {
        didSet{
            if let dn = messageD{
                authorLabel?.text = dn.3
                dateLabel?.text = dn.2
                messageLabel?.text = dn.1
                }

            }
    }
}
