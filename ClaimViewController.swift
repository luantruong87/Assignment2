//
//  ClaimViewController.swift
//  SimpleHTTPClient1
//
//  Created by luan nguyen on 11/24/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class ClaimViewController: UIViewController {

    var cService : ClaimService!
    var detailScreenGenerator : ClaimDetailScreenGenerator!
    
    @objc func addClaimToDB(sender: UIButton) {
        detailScreenGenerator.setViewReference()
        cService = ClaimService(vc : self)
        let checked = detailScreenGenerator.dataCheck()
        if checked == true {
            cService.addClaim(pObj: Claim(title: detailScreenGenerator.vals[0].text! ,date: detailScreenGenerator.vals[1].text!))
        } else {
            detailScreenGenerator.statusMessage(resp: "failed")
        }

    }
    
    func refreshScreen(sresp: String){
        detailScreenGenerator.statusMessage(resp: sresp)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        detailScreenGenerator = ClaimDetailScreenGenerator(v: view)
        detailScreenGenerator.generate()
        
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(addClaimToDB(sender:)), for: .touchUpInside)
        
    }
}

