//
//  AppHttp.swift
//  TestApp
//
//  Created by Niraj Kumar on 01/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class AppHttp {
    static let shared = AppHttp ()
    let BASE_URL = "https://api.github.com"
    let BASE_REPO = "Alamofire"
    let BASE_OWNER = "Alamofire"
    
    func getIssues(methodName: String, _ successCallback: @escaping (_ response: Issues)-> Void, errorCallback: @escaping (_ error: String)->Void) -> Void {
        
        if ((NetworkReachabilityManager.default?.isReachable) == true){
            AF.request(BASE_URL + methodName).responseDecodable(of: Issues.self) { response in
                
                if response.error != nil {
                    errorCallback(response.error.debugDescription)
                }else {
                    guard let issues = try? response.result.get() else {
                        errorCallback("Something went wrong. Please try again.")
                        return
                    }
                    AppCoreData.shared.saveIssues(issues: issues)
                    successCallback(issues)
                }
                
            }
        }else {
            if let issues = AppCoreData.shared.getIssues(), issues.count > 0 {
                successCallback(issues)
            }else {
                errorCallback("Please enable internet")
            }
        }
        
    }
}
