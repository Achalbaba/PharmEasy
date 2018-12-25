//
//  HomeVC.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/24/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var arrUserData = NSMutableArray()
    var totalUser   = 0
    var userPerPage = 3
    var currentPage = 1
    @IBOutlet weak var tblUserList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblUserList.register(UINib(nibName: TableViewCellIdentifier.userListCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.userListCell)
        wsGetUserList()
        self.navigationItem.title = "Home"
    }
    
    func wsGetUserList(){
        let ws = WebService()
        ws.getByUrl(path: WebServiceConstant.BaseURL+WebServiceURLConstant.userList+"?page=\(currentPage)", params: nil) { (status, response, error) in
            if status{
                if let data = response{
                    if self.arrUserData.count == 0{
                        self.arrUserData = NSMutableArray(array: User.modelsFromDictionaryArray(array: data[WebServiceConstant.kData] as! NSArray))
                    }else{
                        self.arrUserData.addObjects(from: User.modelsFromDictionaryArray(array: data[WebServiceConstant.kData] as! NSArray) as! [Any])
                    }
                    self.totalUser = getInt(data[WebServiceConstant.kTotal] as AnyObject)
                    self.userPerPage = getInt(data[WebServiceConstant.kPerPage] as AnyObject)
                    DispatchQueue.main.async {
                        self.tblUserList.reloadData()
                    }
                }
            }
        }
        
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == SegueIdentifier.homeVCToDetailVC){
            let idx = sender as! Int
            let destination = segue.destination as! DetailVC
            destination.objUser = arrUserData[idx] as! User
        }
    }
}

extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let objModel = arrUserData[indexPath.row] as! User
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.userListCell, for: indexPath) as! UserListCell
            cell.initWithObject(objUser: objModel)
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SegueIdentifier.homeVCToDetailVC, sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == arrUserData.count - 2) && (arrUserData.count != totalUser){
            currentPage = currentPage + 1
            wsGetUserList()
        }
    }
}

