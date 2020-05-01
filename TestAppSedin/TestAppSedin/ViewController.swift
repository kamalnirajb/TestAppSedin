//
//  ViewController.swift
//  TestApp
//
//  Created by Niraj Kumar on 01/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblIssues: UITableView!
    var arrIssues: Issues = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppHttp.shared.getIssues(methodName: "/repos/Alamofire/Alamofire/issues", { (issues) in
            self.arrIssues = issues
            self.tblIssues.reloadData()
        }) { (error) in
            print(error)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrIssues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserCellTableViewCell", for: indexPath) as! UserCellTableViewCell
        if var title = arrIssues[indexPath.row].title as? String{
            cell.title.text = title
        }
        if var username = arrIssues[indexPath.row].user.login as? String{
            cell.username.text = username
        }
        if var createAt = arrIssues[indexPath.row].createdAt as? String{
            cell.createAt.text = createAt
        }
        return cell
    }
}

