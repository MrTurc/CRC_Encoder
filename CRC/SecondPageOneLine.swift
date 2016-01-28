//
//  SecondPageOneLine.swift
//  CRC
//
//  Created by Anton Kapuhs on 27.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class SecondPageOneLine: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printMassegeLable.adjustsFontSizeToFitWidth = true
        printCRC()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var printMassegeLable: UILabel!
    
    func printCRC(){
        for(var i = generatedMassage.count-1; i >= 0; i--)
        {
            if(generatedMassage[i] == false)
            {
                printMassegeLable.text = printMassegeLable.text! + "1 "
            }
            else if (generatedMassage[i] == true)
            {
                printMassegeLable.text = printMassegeLable.text! + "0 "
            }
        }
        printMassegeLable.text = printMassegeLable.text! + "\n"
    }

}
