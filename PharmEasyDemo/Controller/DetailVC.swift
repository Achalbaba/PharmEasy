//
//  DetailVC.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/24/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var objUser = User()
    
    @IBOutlet weak var lblUserID: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgUserAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgUserAvatar.layer.cornerRadius = imgUserAvatar.frame.size.height/2
        imgUserAvatar.layer.masksToBounds = true
        if !objUser.avatar.isEmpty{
        imgUserAvatar.sd_setImage(with:URL(string: objUser.avatar) , completed:nil)
        }
        lblUserID.text = getvalue(objUser.id as AnyObject)
        lblUserName.text = objUser.firstName + " " + objUser.lastName
        self.navigationItem.title = "Profile"
    }
}
