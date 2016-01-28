//
//  Datastructure.swift
//  CRC
//
//  Created by Anton Kapuhs on 28.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

struct CRCzurVereinfachung {
    var data = [[Character]]()
    var compared = [Bool]()
    var fixed = [Bool]()
    var ones = [Int]()
    var dashes = [Int]()
}

var code = Array<Array<Bool>>()

var generatedMassage = [Bool]()

var massage = [Bool]()

var generator = [Bool]()

var minimized = Array<Array<Bool>>()

var output = Array<CRCzurVereinfachung>()

var n = 0
var m = 0
var k = 0

func shiftLeft(inout data:[Bool]){
    data.removeAtIndex(data.count-1)
    data.insert(true, atIndex: 0)
}

func shiftRight(inout data:[Bool]){
    data.insert(true, atIndex: data.count-1)
    data.removeAtIndex(0)
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
    
    
    while(massege.count < k){
        massege.insert(true, atIndex: massege.count)
    }
    while(massege.count < genrator.count){
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


func copyCRCforMinimization(var indata:[[Bool]], inout outdata:CRCzurVereinfachung,x:Int)
{
    var countForWhile = 0
    
    while(countForWhile < indata.count){
        if(indata[countForWhile][x] == true){
            indata.removeAtIndex(countForWhile)
            countForWhile=0
        }else{
            countForWhile++
        }
    }
    
    for(var i=0;i<k;i++){
        for(var e = 0; e<indata.count;e++){
            indata[e].removeAtIndex(0)
        }
    }
    
    for(var i = 0; i < indata.count;i++){
        outdata.data.append([])
        outdata.data.count
        outdata.ones.insert(0, atIndex: i)
        
        for(var e = 0; e < indata[i].count;e++){
            if(indata[i][e] == true){
                outdata.data[i].append("0")
            }else{
                outdata.data[i].append("1")
                outdata.ones[i]++
            }
        }
        outdata.compared.append(false)
        outdata.fixed.append(false)
        outdata.dashes.append(0)
    }
}


func quin(inout inputCRC:CRCzurVereinfachung){
    var tmpCRC = CRCzurVereinfachung()
    var moreThenOne = 0
    
    for(var i = 0; i < inputCRC.data.count;i++){
        for(var e = 0; e < inputCRC.data.count;e++){
            if(inputCRC.ones[i]+1 == inputCRC.ones[e] && inputCRC.dashes[i] == inputCRC.dashes[e]){
                for(var c = 0; c < inputCRC.data[i].count;c++){
                    if(inputCRC.data[i][c] != inputCRC.data[e][c]){
                        moreThenOne++
                    }
                }
                if(moreThenOne == 1){
                    tmpCRC.data.append([])
                    tmpCRC.dashes.append(inputCRC.dashes[i])
                    tmpCRC.ones.append(0)
                    tmpCRC.fixed.append(false)
                    tmpCRC.compared.append(false)
                    inputCRC.compared[i] = true
                    inputCRC.compared[e] = true
                    
                    for(var c = 0; c < inputCRC.data[i].count;c++){
                        if(inputCRC.data[i][c] != inputCRC.data[e][c]){
                            tmpCRC.data[tmpCRC.data.count-1].append("-")
                            tmpCRC.dashes[tmpCRC.data.count-1]++
                        }else{
                            tmpCRC.data[tmpCRC.data.count-1].append(inputCRC.data[i][c])
                            if(tmpCRC.data[tmpCRC.data.count-1][c] == "1"){
                                tmpCRC.ones[tmpCRC.data.count-1]++
                            }
                        }
                        
                    }
                }
                moreThenOne=0
            }
        }
        if(inputCRC.compared[i] == false){
            tmpCRC.data.append([])
            tmpCRC.dashes.append(inputCRC.dashes[i])
            tmpCRC.ones.append(inputCRC.ones[i])
            tmpCRC.fixed.append(true)
            tmpCRC.compared.append(false)
            
            tmpCRC.data[tmpCRC.data.count-1]=inputCRC.data[i]
        }
    }
    inputCRC = tmpCRC
}


func getRidOfMultiTherms(inout inputCRC:CRCzurVereinfachung)
{
    var countSame = 0
    var i = 0
    while(i < inputCRC.data.count-1)
    {
        for(var e = 0; e < inputCRC.data[i].count; e++){
            if(inputCRC.data[i][e] == inputCRC.data[i+1][e]){
                countSame++
            }
        }
        if(countSame == inputCRC.data[i].count){
            inputCRC.data.removeAtIndex(i+1)
            i = 0
        }else{
            i++
        }
        countSame = 0
    }
}


func getQuin(){
    
    for(var xStellen = 0; xStellen < k; xStellen++){
        
        var CRCRawData = CRCzurVereinfachung()
        var notFixed = true
        var fixCount = 0
        copyCRCforMinimization(code, outdata: &CRCRawData, x: xStellen)
        
        while(notFixed){
            quin(&CRCRawData)
            for(var i = 0; i < CRCRawData.fixed.count;i++){
                if(CRCRawData.fixed[i] == true){
                    fixCount++
                }
            }
            if(fixCount == CRCRawData.fixed.count ){
                notFixed = false
            }
        }
        CRCRawData.data.count
        
        getRidOfMultiTherms(&CRCRawData)
        
        output.append(CRCRawData)
    }
}

class Datastructure: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
