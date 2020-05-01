//
//  ViewController.swift
//  TestApp
//
//  Created by Niraj Kumar on 01/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var viewLoader: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tblIssues: UITableView!
    var arrIssues: Issues = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loader.startAnimating()
        self.loadIssues()
    }
    
    func loadIssues() -> Void {
        AppHttp.shared.getIssues(methodName: "/repos/\(AppHttp.shared.BASE_REPO)/\(AppHttp.shared.BASE_OWNER)/issues", { (issues) in
            self.arrIssues = issues
            self.tblIssues.reloadData()
            self.loader.stopAnimating()
            self.viewLoader.isHidden = true
            self.tblIssues.isHidden = false
        }) { (error) in
            print(error)
        }
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrIssues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserCellTableViewCell", for: indexPath) as! UserCellTableViewCell
        if let title = arrIssues[indexPath.row].title{
            cell.title.text = title
        }
        if let username = arrIssues[indexPath.row].user?.login{
            cell.username.text = username
        }
        if let createAt = arrIssues[indexPath.row].createdAt{
            cell.createAt.text = createAt.formatDateToString()
        }
        return cell
    }
}

extension Date {
    func toFormattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd, HH:mm:ss"
        let str = dateFormatter.string(from: self)
        return str
    }
}

extension String {
    func formatDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd, HH:mm:ss"
        let str = dateFormatter.string(from: date)
        return str
    }
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        return date
    }
}
