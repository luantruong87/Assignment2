//
//  ClaimFieldValueViewGenerator.swift
//  SimpleHTTPClient1
//
//  Created by luan nguyen on 11/24/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//
import UIKit

class ClaimFieldValueViewGenerator {
    var lblName : String!
    
    init(n : String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        let lbl = UILabel()
        lbl.text = lblName
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)

        let val = UITextField()
        val.text = "Initial Value"

        stackView.addArrangedSubview(val)

        return stackView
    }
    
}
