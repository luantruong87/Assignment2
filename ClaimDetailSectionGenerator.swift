//
//  ClaimDetailSectionGenerator.swift
//  SimpleHTTPClient1
//
//  Created by luan nguyen on 11/24/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//
import UIKit

class StatusSectionGenerator{
    func generate() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        
        var vGenerator : ClaimFieldValueViewGenerator!
        var sView : UIStackView!
        vGenerator = ClaimFieldValueViewGenerator(n:"Status:")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        
        return stackView
    }
}

class ClaimDetailSectionGenerator {

    func cHeader() -> UIStackView{
        let stackView = UIStackView()
        let lheader = UILabel()
        lheader.text = "Please Enter Claim Information"
        lheader.font = UIFont(name: "Georgia-Bold", size: 15)
        lheader.textAlignment = .center
        stackView.addArrangedSubview(lheader)
        return stackView
    }
    
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        
        //

        stackView.addArrangedSubview(cHeader())
        var vGenerator : ClaimFieldValueViewGenerator!
        var sView : UIStackView!
        vGenerator = ClaimFieldValueViewGenerator(n:"Claim Title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)

        vGenerator = ClaimFieldValueViewGenerator(n:"Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
                
        return stackView
    }
}

class addbuttonSectionGenerator{
    func generate() -> UIStackView{
        //stackview of button
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 5
            
        //add button
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        //btn.backgroundColor = UIColor.cyan
        btn.layer.borderWidth = 2.0
        btn.layer.borderColor = UIColor.cyan.cgColor
        btn.contentEdgeInsets = UIEdgeInsets.init(top: 5,left: 15,bottom: 5,right: 15)
        bStackView.addArrangedSubview(btn)
        return bStackView
    }
}

class ClaimDetailScreenGenerator {
    
    var root : UIView!
    var detailSecView : UIStackView!
    var buttonSecView : UIStackView!
    var statusSecView : UIStackView!
    var vals : [UITextField]!
    var lbls : [UILabel]!
    var lbll : UILabel!
    var vall : UITextField!
    var nextBtn : UIButton!
    
    init(v : UIView) {
        root = v
    }
    
    func initialText(){
        vals[0].text = ""
        vals[1].text = ""
        vall.text = "<Status Message>"
    }
    
    func statusMessage(resp: String){
        if resp == "The Claim record was successfully inserted (via POST Method)." {
            vall.text = "Claim \(vals[0].text!) was successfully created"
        } else {
            vall.text = "Claim \(vals[0].text!) failed to be created"
            
        }
        
        vals[0].text = ""
        vals[1].text = ""
    }
    
    func setViewReference() {
        vals = [UITextField]()
        lbls = [UILabel]()
        //
        for sv in detailSecView.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        
        for sv2 in statusSecView.arrangedSubviews{
            let innerStackView = sv2 as! UIStackView
            for ve2 in innerStackView.arrangedSubviews {
                if ve2 is UITextField {
                    vall = ve2 as! UITextField
                } else {
                    lbll = ve2 as! UILabel
                }
            }
        }
         

        print("UITextField references created.")
        
        // Make UITextField readonly
        for v in vals {
            v.isUserInteractionEnabled = true
        }
        vall.isUserInteractionEnabled = false

        
        //
        for sv in buttonSecView.arrangedSubviews {
            let btn = sv as! UIButton
            if btn.titleLabel?.text == "Add" {
                nextBtn = btn
            }
        }
    }
    
    func setDetailSecConstraints() {
        for i in 1...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[1].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in 1...lbls.count-1 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[1].trailingAnchor)
            constr.isActive = true
        }
        //
        for i in 0...vals.count-1 {
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
        detailSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = detailSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
        let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setStatusSecConstraints(){
        lbll.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        lbll.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        lbll.translatesAutoresizingMaskIntoConstraints = false
        let constr = lbll.trailingAnchor.constraint(equalTo: lbls[1].trailingAnchor)
        constr.isActive = true
        
        vall.setContentHuggingPriority(.defaultLow, for: .horizontal)
        statusSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont2 = statusSecView.topAnchor.constraint(equalTo: buttonSecView.bottomAnchor)
        let lCont2 = statusSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont2 = statusSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont2.isActive = true
        lCont2.isActive = true
        trCont2.isActive = true
    }
    
    func setButtonSecConstraints() {
        buttonSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = buttonSecView.topAnchor.constraint(equalTo: detailSecView.bottomAnchor)
        let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tpConst.isActive = true
        trConst.isActive = true
    }
    
    func generate() {
        //
        detailSecView = ClaimDetailSectionGenerator().generate()
        print("Detail section was created. ")
        buttonSecView = addbuttonSectionGenerator().generate()
        print("Button section was created. ")
        statusSecView = StatusSectionGenerator().generate()
        print("Status section was created. ")
        root.addSubview(detailSecView)
        root.addSubview(buttonSecView)
        root.addSubview(statusSecView)
        
        //
        setViewReference()
        print("setViewReference() called.")
        
        // set constraints for detailSecView
        setDetailSecConstraints()
        print("setDetailSecConstraints() called.")
        
        // set constraints for buttonSecView
        setButtonSecConstraints()
        print("setButtonSecConstraints() called.")
        
        // set constraints for statusSecView
        setStatusSecConstraints()
        print("setStatusSecConstraints() called.")
        
        //set initial text
        initialText()
        
        
    }
}
