//
//  AppCoreData.swift
//  TestAppSedin
//
//  Created by Niraj Kumar on 02/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class AppCoreData {
    static let shared = AppCoreData()
    
    /**
     * Save issues to database
     * @Param {issues: Issues}
     *
     * @Return Void
     */
    func saveIssues(issues: Issues) -> Void {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext

        if let issuesEntity = NSEntityDescription.entity(forEntityName: "IssueEntity", in: managedContext){
            for issue:Issue in issues {
                let issueEntity = NSManagedObject(entity: issuesEntity, insertInto: managedContext)
                do {
                    let jsonData = try? JSONEncoder().encode(issue)
                    issueEntity.setValue(jsonData, forKey: "issue")
                    try managedContext.save()
                }catch let error {
                    print(error)
                }
            }
        }
    }
    
    /**
    * Fetch issue from databsae
    *
    * @Return Issues
    */
    func getIssues() -> Issues? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return []}
        let managedContext = appDelegate.persistentContainer.viewContext

        let issuesFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "IssueEntity")

        do {
            let result = try managedContext.fetch(issuesFetchRequest)
            var issues: Issues = []
            
            for data in result as! [NSManagedObject] {
                let issue = try! JSONDecoder().decode(Issue.self, from: data.value(forKey:"issue") as! Data)
                issues.append(issue)
            }
            return issues
        }catch let error {
            print(error)
        }
        return []
    }
}
