//
//  ClaimService.swift
//  SimpleHTTPClient1
//
//  Created by luan nguyen on 11/24/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import Foundation

struct Claim : Codable {
    var title : String
    var date : String
}

class ClaimService {
    var respStr : String!
    var claimviewController : ClaimViewController
    
    init(vc : ClaimViewController) {
        claimviewController = vc
    }
    
    func addClaim(pObj : Claim) {
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8040/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                self.respStr = String(bytes: resp, encoding: .utf8)
                OperationQueue.main.addOperation {
                    self.claimviewController.refreshScreen(sresp: self.respStr!)
                }
                
                print("The response data sent from the server is \(self.respStr!)")
                //
            } else if let respError = error {
                print("Server Error : \(respError)")
            }
        }
        //print(self.sresp)
        task.resume()
    }
}
