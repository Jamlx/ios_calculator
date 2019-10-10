//
//  ViewController.swift
//  MyCalculator
//
//  Created by James Cavanaugh on 10/10/19.
//  Copyright © 2019 James Cavanaugh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view loaded")
    }
    
    @IBOutlet weak var lblOutput: UILabel!
    var val1: Double = 0.0
    var val2: Double = 0.0
    var curOp: String = "none"
    var midOp: Int = 0
    
    @IBAction func btnNumberClick(_ sender: UIButton) {
        if(sender.currentTitle != nil){
            if(sender.currentTitle == "." && lblOutput.text!.contains(".")){
                
            }else if(lblOutput.text=="0" || midOp==3){
                val1 = Double(sender.currentTitle!)!
                lblOutput.text = sender.currentTitle!
                midOp=0        }else{
                if (sender.currentTitle != nil && lblOutput.text != nil){
                    if(midOp==0){
                        val1 = Double(lblOutput.text! + sender.currentTitle!)!
                        lblOutput.text = lblOutput.text! + sender.currentTitle!
                    }else if(midOp==1){
                        val2 = Double(sender.currentTitle!)!
                        lblOutput.text = sender.currentTitle!
                        midOp=2
                    }else if(midOp==2){
                        val2 = Double(lblOutput.text! + sender.currentTitle!)!
                        lblOutput.text = lblOutput.text! + sender.currentTitle!
                    }
                    
                }
            }

            if (sender.currentTitle != nil){
                print(sender.currentTitle! + " btn clicked")
            }
        }
    }
    
    
    @IBAction func btnClearClick(_ sender: Any) {
        lblOutput.text = "0"
        midOp = 0
        curOp = "none"
        val1 = 0
        val2 = 0
        print("Clear btn clicked")
    }
    
    
    @IBAction func btnNegateClick(_ sender: UIButton) {
        if(midOp==0 || midOp==3){
            val1.negate();
            lblOutput.text = String(val1)
        }else if(midOp==1 || midOp==2){
            val2.negate();
            lblOutput.text = String(val2)
        }
    }
    
    @IBAction func btnPercentClick(_ sender: UIButton) {
        if(lblOutput.text != nil){
            let out = val1/100.0
            lblOutput.text = String(out)
            midOp = 3
            curOp = "none"
            val1 = out
            val2 = 0        }
    }
    
    
    @IBAction func btnSqrtClick(_ sender: UIButton) {
        if(lblOutput.text != nil){
            let out = val1.squareRoot()
            lblOutput.text = String(out)
            midOp = 3
            curOp = "none"
            val1 = out
            val2 = 0
        }
    }
    
    
    
    @IBAction func btnDivideClick(_ sender: UIButton) {
        midOp=1
        curOp="div"
    }
    
    @IBAction func btnMultiplyClick(_ sender: UIButton) {
        midOp=1
        curOp="mult"
    }
    
    @IBAction func btnSubtractClick(_ sender: UIButton) {
        midOp=1
        curOp="sub"
    }
    
    @IBAction func btnAddClick(_ sender: UIButton) {
        midOp=1
        curOp="add"
    }
    
    @IBAction func btnExpClick(_ sender: UIButton) {
        midOp=1
        curOp="exp"
    }
    @IBAction func btnEqualsClick(_ sender: UIButton) {
        if(val1 != 0 && val2 != 0){
            var out: Double = 0
            if(curOp == "add"){
                out = val1+val2
            }else if(curOp == "sub"){
                out = val1-val2
            }else if(curOp == "mult"){
                out = val1*val2
            }else if(curOp == "div"){
                out = val1/val2
            }
            lblOutput.text = String(out)
            midOp = 3
            curOp = "none"
            val1 = out
            val2 = 0
        }
    }

}

