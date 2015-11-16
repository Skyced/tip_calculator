//
//  ViewController.swift
//  tip
//
//  Created by cedric jo on 11/6/15.
//  Copyright © 2015 cedric jo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tip = Tip()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blackColor()
        TotalBefore.text = String("")
    
        
    }
    @IBOutlet weak var TotalBefore: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var HighTip: UILabel!
    @IBOutlet weak var MidTip: UILabel!
    @IBOutlet weak var LowTip: UILabel!
    @IBOutlet weak var HighTipOnly: UILabel!
    @IBOutlet weak var MidTipOnly: UILabel!
    @IBOutlet weak var LowTipOnly: UILabel!
    @IBOutlet weak var LowTotal: UILabel!
    @IBOutlet weak var MidTotal: UILabel!
    @IBOutlet weak var HighTotal: UILabel!
    @IBOutlet var ButtonsColor: [UIButton]!
    @IBOutlet weak var DotButton: UIButton!
    
    var total = ""
    @IBAction func NumbersButton(sender: UIButton) {
        if sender.tag == 10 {
            total += "."
            DotButton.enabled = false
        }
        else if sender.tag == 11 {
            total = "0"
            TotalBefore.text = total
            DotButton.enabled = true
            if Double(total) != nil {
                calcTip()
                calcTotal()
            }
            total=""
            return
        }
        else {
            total += String(sender.tag)
        }
        TotalBefore.text = total
        calcTip()
        calcTotal()
        calcGroup()
    }
    
    @IBAction func IncreaseTip(sender: UISlider) {
        HighTip.text = String(Int(sender.value)+10)+String("%")
        MidTip.text = String(Int(sender.value)+5)+String("%")
        LowTip.text = String(Int(sender.value))+String("%")
        tip.high = Int(sender.value)+10
        tip.mid = Int(sender.value)+5
        tip.low = Int(sender.value)
        if Double(total) != nil {
        calcTip()
        calcTotal()
        calcGroup()
        }
        
    }
    @IBOutlet weak var GroupNumber: UILabel!
    
    @IBAction func Group(sender: UISlider) {
        tip.group = Double(Int(sender.value))
        GroupNumber.text = String("Group: \(Int(sender.value))")
        calcGroup()
    }
    func calcGroup() {
        tip.grouphigh = Double(round(tip.hightotal/tip.group*100)/100)
        HighTotal.text = String(tip.grouphigh)
        tip.groupmid = Double(round(tip.midtotal/tip.group*100)/100)
        MidTotal.text = String(tip.groupmid)
        tip.grouplow = Double(round(tip.lowtotal/tip.group*100)/100)
        LowTotal.text = String(tip.grouplow)
        
        tip.grouptiphigh = Double(round(tip.hightip/tip.group*100)/100)
        tip.grouptipmid = Double(round(tip.midtip/tip.group*100)/100)
        tip.grouptiplow = Double(round(tip.lowtip/tip.group*100)/100)
        HighTipOnly.text = String(tip.grouptiphigh)
        MidTipOnly.text = String(tip.grouptipmid)
        LowTipOnly.text = String(tip.grouptiplow)
        
    }
    func calcTip(){
        
        tip.hightip = Double(Double(total)! * Double(tip.high)/100)
        tip.hightip = Double(round(100*tip.hightip)/100)
        HighTipOnly.text = String(tip.hightip)
        tip.midtip = Double(Double(total)! * Double(tip.mid)/100)
        tip.midtip = Double(round(100*tip.midtip)/100)
        MidTipOnly.text = String(tip.midtip)
        tip.lowtip = Double(Double(total)! * Double(tip.low)/100)
        tip.lowtip = Double(round(100*tip.lowtip)/100)
        LowTipOnly.text = String(tip.lowtip)
    
        
    }
    func calcTotal() {
        tip.hightotal = Double(total)! + tip.hightip
        HighTotal.text = String(tip.hightotal)
        tip.midtotal = Double(total)! + tip.midtip
        MidTotal.text = String(tip.midtotal)
        tip.lowtotal = Double(total)! + tip.lowtip
        LowTotal.text = String(tip.lowtotal)
        
    }
}

