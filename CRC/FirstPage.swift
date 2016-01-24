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

var generator = [Bool](arrayLiteral: true,false,false,true)

var n = 7
var m = 4
var k = 3

func shiftLeft(inout data:[Bool]){
    for(var i = data.count-1; i > 0; i--){
        data[i] = data[i-1]
    }
    data[0]=true
}

func shiftRight(inout data:[Bool]){
    for(var i = 0; i < (data.count-1); i++){
        data[i] = data[i+1]
    }
    data[data.count-1] = true
}


class FirstPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculationAndNextPage(sender: AnyObject) {
        fullCRC(&code,gerator: generator, n: n, m: m, k: k)
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

