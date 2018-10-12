//
//  ViewController.swift
//  TipCalc
//
//  Created by David E Bratton on 10/12/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTotalTxt: UITextField!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var tipTotalTxt: UITextField!
    @IBOutlet weak var grandTotalTxt: UITextField!
    @IBOutlet weak var inBankLbl: UILabel!
    @IBOutlet weak var inBankAmountLbl: UILabel!
    
    var bankTotal: Double = 200.00
    var tipPercent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setTipPercent(item: "15")
    }

    func setTipPercent(item: String) {
        switch item {
        case "15":
            tipPercent = 0.15
        case "18":
            tipPercent = 0.18
        case "20":
            tipPercent = 0.20
        default:
            break
        }
    }
    @IBAction func tipPercentSegmentPressed(_ sender: Any) {
        if tipPercentSegment.selectedSegmentIndex == 0 {
            setTipPercent(item: "15")
        } else if tipPercentSegment.selectedSegmentIndex == 1 {
            setTipPercent(item: "18")
        } else {
            setTipPercent(item: "20")
        }
    }
    
    @IBAction func grantTotalBtnPressed(_ sender: Any) {
        if let billTotalText = billTotalTxt.text {
            if let billTotal = Double(billTotalText) {
                let tipTotal = billTotal * tipPercent
                let grandTotal = tipTotal + billTotal
                let inBankTotal = bankTotal - grandTotal
                tipTotalTxt.text = String(format: "%.2f", tipTotal)
                grandTotalTxt.text = String(format: "%.2f", grandTotal)
                inBankAmountLbl.text = String(format: "%.2f", inBankTotal)
                print("Bill Total: \(billTotalText)")
                print("Tip Percent: \(tipPercent)")
                print("Tip Total: \(tipTotal)")
                print("Bill Total Text: \(grandTotal)")
                print("Money In Bank: \(inBankTotal)")
            }
        }
    }
}

