//
//  ThirdPage.swift
//  CRC
//
//  Created by Anton Kapuhs on 24.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class ThirdPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nachQuine.adjustsFontSizeToFitWidth = true
        printQuine()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nachQuine: UILabel!
    
    
    func printQuine(){
        var firstAnd = false
        nachQuine.text = "Minimalform nach Quine:\n\n"
        for(var i = 0; i < output.count;i++){
            nachQuine.text = nachQuine.text! + "y\(i)= "
            for(var e = 0; e < output[i].data.count;e++){
                nachQuine.text = nachQuine.text! + "("
                for(var a = output[i].data[e].count-1; a >= 0;a--){
                    if(output[i].data[e][a] == "0"){
                        if(firstAnd){
                        nachQuine.text = nachQuine.text! + " AND "
                        }
                        nachQuine.text = nachQuine.text! + "x\(a) "
                        firstAnd = true
                    }else if((output[i].data[e][a]) == "1"){
                        if(firstAnd){
                        nachQuine.text = nachQuine.text! + " AND "
                        }
                        nachQuine.text = nachQuine.text! + "(Not x\(a)) "
                        firstAnd = true
                    }
                }
                nachQuine.text = nachQuine.text! + ")"
                if(e+1 != output[i].data.count){
                  nachQuine.text = nachQuine.text! + " OR "
                }
                firstAnd = false
            }
            nachQuine.text = nachQuine.text! + "\n\n"
        }
    }
    
}
