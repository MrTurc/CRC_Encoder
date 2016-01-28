//
//  SecondPage.swift
//  CRC
//
//  Created by Anton Kapuhs on 24.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class SecondPage: UIViewController {
    var oneTime = true
    override func viewDidLoad() {
        super.viewDidLoad()
        CRCLable.adjustsFontSizeToFitWidth = true
        printCRC()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var CRCLable: UILabel!
    @IBOutlet weak var CRCButton: UIButton!
    
    @IBAction func printCRCButton(sender: AnyObject){
        if(oneTime){
        getQuin()
        }
        }
    
    func printCRC(){
        CRCLable.text = "\t\tCRC (\(n)/\(m))\n"
        CRCLable.text = CRCLable.text! + "\t\t"
        for(var e = 0; e < Int(pow(2.0, Double(m))); e++){
            CRCLable.text = CRCLable.text! + "\(e):\t"
            //for(var i = k-1; i >= 0; i--)
            for(var i = code[e].count-1; i >= 0; i--)
            {
                if(code[e][i] == false)
                {
                    CRCLable.text = CRCLable.text! + "1 "
                }
                else if (code[e][i] == true)
                {
                    CRCLable.text = CRCLable.text! + "0 "
                }
            }
            CRCLable.text = CRCLable.text! + "\n\t\t"
        }
        
    }

}
