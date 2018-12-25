//
//  UserListCell.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/24/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import UIKit
import SDWebImage
class UserListCell: UITableViewCell {

    @IBOutlet weak var imgUserAvatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgUserAvatar.layer.cornerRadius = imgUserAvatar.frame.size.height/2
        imgUserAvatar.layer.masksToBounds = true
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithObject(objUser: User) {
        if !objUser.avatar.isEmpty{
            imgUserAvatar.sd_setImage(with: URL(string: objUser.avatar), completed: nil)
            lblUserName.text = objUser.firstName + " " + objUser.lastName
        }
    }
}
