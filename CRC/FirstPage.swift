//
//  ViewController.swift
//  CRC
//
//  Created by Anton Kapuhs on 24.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class FirstPage: UIViewController {
    
    var generatorFirst = true

    override func viewDidLoad() {
        super.viewDidLoad()
        plusMinStepper.wraps = true
        plusMinStepper.autorepeat = true
        plusMinStepper.maximumValue = 32
        plusMinStepper.minimumValue = 0
        m = 0
        massage.removeAll()
        generator.removeAll()
        code.removeAll()
        output.removeAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculationAndNextPage(sender: AnyObject) {
        k = generator.count-1
        n = k + m
        fullCRC(&code,gerator: generator, n: n, m: m, k: k)
    }
    
    @IBOutlet weak var massegeLabel: UILabel!
    @IBOutlet weak var generatorLabel: UILabel!
    @IBOutlet weak var plusMinStepper: UIStepper!
    @IBAction func plusMinButton(sender: AnyObject) {
        m = Int(plusMinStepper.value)
        massegeLabel.text = "\(m)"
    }
    
    @IBAction func delButton(sender: AnyObject) {
        if(generator.count > 0){
            generator.removeFirst()
        generatorLabel.text = ""
        for(var i = generator.count-1; i >= 0;i--){
            if(generator[i]){
                generatorLabel.text = generatorLabel.text! + "0"
            }else{
                generatorLabel.text = generatorLabel.text! + "1"
            }
        }
        }
    }
    @IBAction func zeroButton(sender: AnyObject) {
        if(generatorFirst){
            generatorLabel.text = "0"
            generatorFirst = false
        }else{
            generatorLabel.text = generatorLabel.text! + "0"
        }
        generator.insert(true, atIndex: 0)
    }
    
    @IBAction func oneButton(sender: AnyObject) {
        if(generatorFirst){
            generatorLabel.text = "1"
            generatorFirst = false
        }else{
            generatorLabel.text = generatorLabel.text! + "1"
        }
        generator.insert(false, atIndex: 0)
    }
    
}

