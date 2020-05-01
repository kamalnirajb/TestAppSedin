//
//  AppHttp.swift
//  TestApp
//
//  Created by Niraj Kumar on 01/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//

import Foundation
import Alamofire

class AppHttp {
    static let shared = AppHttp ()
    let BASE_URL = "https://api.github.com/"
    
    func getIssues(methodName: String, _ successCallback: @escaping (_ response: Issues)-> Void, errorCallback: @escaping (_ error: String)->Void) -> Void {
        AF.request(BASE_URL + methodName).responseJSON { response in switch response.result{
        case .success:
            let issues = try? JSONDecoder().decode(Issues.self, from: response.data!)
            if (successCallback != nil) {
                successCallback(issues ?? [])
            }
        case .failure:
            if (errorCallback != nil) {
                errorCallback(response.error.debugDescription)
            }
            }
            
        }
    }
}
