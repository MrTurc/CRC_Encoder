//
//  SecondPage.swift
//  CRC
//
//  Created by Anton Kapuhs on 24.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class SecondPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CRCLable.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var CRCLable: UILabel!
    
    @IBAction func printCRCButton(sender: AnyObject) {
        printCRC()
    }
    
    func printCRC(){
        for(var e = 0; e < Int(pow(2.0, Double(m))); e++){
            CRCLable.text = CRCLable.text! + "\(e):\t"
            for(var i = k-1; i >= 0; i--)
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
            CRCLable.text = CRCLable.text! + "\n"
        }
    }

}
