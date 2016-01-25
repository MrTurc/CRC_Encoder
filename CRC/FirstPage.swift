//
//  ViewController.swift
//  CRC
//
//  Created by Anton Kapuhs on 24.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

var code = Array<Array<Bool>>()

var massage = [Bool](arrayLiteral: false,true,true,false)

var generator = [Bool]()

var n = 7
var m = 4
var k = 3

func shiftLeft(inout data:[Bool]){
    data.removeAtIndex(data.count-1)
    data.insert(true, atIndex: 0)
}

func shiftRight(inout data:[Bool]){
    data.insert(true, atIndex: data.count-1)
    data.removeAtIndex(0)
}


class FirstPage: UIViewController {
    
    var generatorFirst = true

    override func viewDidLoad() {
        super.viewDidLoad()
        plusMinStepper.wraps = true
        plusMinStepper.autorepeat = true
        plusMinStepper.maximumValue = 32
        plusMinStepper.minimumValue = 0
        m = 0
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
    
    func xor(x1:Bool,x2:Bool)->Bool{
        if(x1 == x2){
            return true
        }
        return false
    }
    
    func oneLineCRC(var massege:[Bool], genrator:[Bool], k:Int)->[Bool]
    {
        var tmp:[Bool] = massege
        var addedLines = 0;
        
        
        while(massege.count < generator.count){
            massege.insert(true, atIndex: massege.count)
            addedLines++
        }
        var i:Int = massege.count
        
        while(i > 0)
        {
            if(massege[massege.count-1] == false)
            {
                for(var n = 0; n < genrator.count;n++)
                {
                    massege[(massege.count - genrator.count + n)] = xor(massege[(massege.count - genrator.count + n)], x2: genrator[n])
                }
            }
            shiftLeft(&massege)
            i--
        }
        
        while(addedLines != 0){
            massege.removeAtIndex(0)
            addedLines--
        }
        for(var n = massege.count; n > (massege.count-k); n--)
        {
            tmp.insert(massege[n-1], atIndex: 0)
        }
        return tmp
    }

    
    func fullCRC(inout outCode:[[Bool]], gerator:[Bool], n:Int, m:Int, k:Int)
    {
        var massegeIntern = [Bool]()
        
        for (var i = 0 ; i < Int(pow(2.0, Double(m)));i++)
        {
            var tmp = i
            while(tmp != 0){
                if(tmp%2 == 0){
                    massegeIntern.append(true)
                }else if(tmp%2 == 1){
                    massegeIntern.append(false)
                }
                tmp = tmp/2
            }
            while(massegeIntern.count < m){
                massegeIntern.append(true)
            }
            outCode.append(oneLineCRC(massegeIntern, genrator: generator, k: k))
            massegeIntern.removeAll()
        }
    }
}

