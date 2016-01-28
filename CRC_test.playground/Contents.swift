//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var code = Array<Array<Bool>>()

var massage = [Bool]()

var generator = [Bool](arrayLiteral: false,false)


var n = 4
var m = 3
var k = 1

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
massage.count

func oneLineCRC(var massege:[Bool], genrator:[Bool], k:Int)->[Bool]
{
    var tmp:[Bool] = massege
    var addedLines = 0;
    
    
    while(massege.count < k){
        massege.insert(true, atIndex: massege.count)
        //addedLines++
    }
    while(massege.count < generator.count){
        massege.insert(true, atIndex: massege.count)
        addedLines++
    }
    var i:Int = massege.count
    
    while(i > 0)
    {
        if(massege[massege.count-1] == false)
        {
            for(var n = 0; n < generator.count;n++)
            {
                massege[(massege.count - generator.count + n)] = xor(massege[(massege.count - generator.count + n)], x2: genrator[n])
            }
        }
        shiftLeft(&massege)
        i--
    }
    
    while(addedLines != 0){
        massege.removeAtIndex(0)
        addedLines--
    }
    massege
    for(var n = massege.count; n > (massege.count-k); n--)
    {
        tmp.insert(massege[n-1], atIndex: 0)
    }
    return tmp
}


func fullCRC(inout outCode:[[Bool]],gerator:[Bool], n:Int, m:Int, k:Int)
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
        massegeIntern
        outCode.append(oneLineCRC(massegeIntern, genrator: generator, k: k))
        massegeIntern.removeAll()
    }
    outCode
    
}


struct CRCzurVereinfachung {
    var data = [[Character]]()
    var compared = [Bool]()
    var fixed = [Bool]()
    var ones = [Int]()
    var dashes = [Int]()
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
    
    indata[0].count
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

//func quineMcClasks(inout input:CRCzurVereinfachung){
//    var CRCDataTmp = CRCzurVereinfachung()
//    var onlyOneDiff = 0
//    for(var i=0;i<input.data.count;i++)
//    {
//        CRCDataTmp.dashes.insert(0, atIndex: 0)
//        CRCDataTmp.data.insert([], atIndex: 0)
//        CRCDataTmp.ones.insert(0, atIndex: 0)
//        CRCDataTmp.compared.insert(false, atIndex: 0)
//
//        for(var e = 0; e < input.data.count;e++)
//        {
//
//            if((input.ones[i]+1) == input.ones[e] && input.dashes[i] == input.dashes[e])
//            {
//                for(var c=0;c < input.data[e].count;c++){
//                    if(input.data[i][c] != input.data[e][c]){
//                        CRCDataTmp.data[0].insert("-", atIndex: c)
//                        CRCDataTmp.dashes[0]++
//                        onlyOneDiff++;
//                    }else{
//                        CRCDataTmp.data[i].insert(input.data[i][c] , atIndex: c)
//                        if(CRCDataTmp.data[0][c] == "1"){
//                            CRCDataTmp.ones[0]++
//                        }
//                    }
//                }
//                if(onlyOneDiff > 1){
//                    CRCDataTmp.dashes[0] = 0
//                }else{
//                    input.compared[e] = true
//                    input.compared[i] = true
//                }
//                onlyOneDiff = 0
//            }
//        }
//    }
//    for(var i = 0; i < input.compared.count;i++){
//        if(input.compared[i] == false){
//            CRCDataTmp.data.insert(input.data[i], atIndex: 0)
//            CRCDataTmp.fixed[0]=true
//        }
//    }
//    input = CRCDataTmp
//}


func quin(inout inputCRC:CRCzurVereinfachung){
    var tmpCRC = CRCzurVereinfachung()
    var moreThenOne = 0
    
    for(var i = 0; i < inputCRC.data.count;i++){
        for(var e = 0; e < inputCRC.data.count;e++){
            if(inputCRC.ones[i]+1 == inputCRC.ones[e] && inputCRC.dashes[i] == inputCRC.dashes[e]){
                for(var c = 0; c < inputCRC.data[i].count;c++){
                    inputCRC.data[i][c]
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


/******************
**      Test     **
*******************/

//oneLineCRC(massage, genrator: generator, k: k)


fullCRC(&code,gerator: generator, n: n, m: m, k: k)


var minimized = Array<Array<Bool>>()
var output = Array<CRCzurVereinfachung>()

for(var xStellen = 0; xStellen < k; xStellen++){
    
    var CRCRawData = CRCzurVereinfachung()
    var notFixed = true
    var fixCount = 0
    xStellen
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

output[0].data
//output[1].data
//output[2].data
//output[3].data
//
//
//    var CRCRawData = CRCzurVereinfachung()
//    var notFixed = true
//    var fixCount = 0
//
//    copyCRCforMinimization(code, outdata: &CRCRawData, x: 2)
//
//CRCRawData.data[0][0]
//CRCRawData.data[0][1]
//CRCRawData.data[0][2]
//CRCRawData.data[0][3]
//
//CRCRawData.data[1][0]
//CRCRawData.data[1][1]
//CRCRawData.data[1][2]
//CRCRawData.data[1][3]
//
//CRCRawData.data[2][0]
//CRCRawData.data[2][1]
//CRCRawData.data[2][2]
//CRCRawData.data[2][3]
//
//CRCRawData.data[3][0]
//CRCRawData.data[3][1]
//CRCRawData.data[3][2]
//CRCRawData.data[3][3]
//
//CRCRawData.data[4][0]
//CRCRawData.data[4][1]
//CRCRawData.data[4][2]
//CRCRawData.data[4][3]
//
//CRCRawData.data[5][0]
//CRCRawData.data[5][1]
//CRCRawData.data[5][2]
//CRCRawData.data[5][3]
//
//CRCRawData.data[6][0]
//CRCRawData.data[6][1]
//CRCRawData.data[6][2]
//CRCRawData.data[6][3]
//
//CRCRawData.data[7][0]
//CRCRawData.data[7][1]
//CRCRawData.data[7][2]
//CRCRawData.data[7][3]
//
//
//
//
//
////    while(notFixed){
////        quin(&CRCRawData)
////        for(var i = 0; i < CRCRawData.fixed.count;i++){
////            if(CRCRawData.fixed[i] == true){
////                fixCount++
////            }
////        }
////        if(fixCount == CRCRawData.fixed.count ){
////            notFixed = false
////        }
////    }
////
////
////
////
//quin(&CRCRawData)
//
//CRCRawData.compared
//
//CRCRawData.dashes
//
//CRCRawData.fixed
//
//CRCRawData.ones
//
//CRCRawData.data[0][0]
//CRCRawData.data[0][1]
//CRCRawData.data[0][2]
//CRCRawData.data[0][3]
//
//CRCRawData.data[1][0]
//CRCRawData.data[1][1]
//CRCRawData.data[1][2]
//CRCRawData.data[1][3]
//
//CRCRawData.data[2][0]
//CRCRawData.data[2][1]
//CRCRawData.data[2][2]
//CRCRawData.data[2][3]
//
//CRCRawData.data[3][0]
//CRCRawData.data[3][1]
//CRCRawData.data[3][2]
//CRCRawData.data[3][3]
//
//CRCRawData.data[4][0]
//CRCRawData.data[4][1]
//CRCRawData.data[4][2]
//CRCRawData.data[4][3]
//
//CRCRawData.data[5][0]
//CRCRawData.data[5][1]
//CRCRawData.data[5][2]
//CRCRawData.data[5][3]
//
//CRCRawData.data[6][0]
//CRCRawData.data[6][1]
//CRCRawData.data[6][2]
//CRCRawData.data[6][3]
//
//CRCRawData.data[7][0]
//CRCRawData.data[7][1]
//CRCRawData.data[7][2]
//CRCRawData.data[7][3]
//
//CRCRawData.data[8][0]
//CRCRawData.data[8][1]
//CRCRawData.data[8][2]
//CRCRawData.data[8][3]
//
//CRCRawData.data[9][0]
//CRCRawData.data[9][1]
//CRCRawData.data[9][2]
//CRCRawData.data[9][3]
//
//CRCRawData.data[10][0]
//CRCRawData.data[10][1]
//CRCRawData.data[10][2]
//CRCRawData.data[10][3]
//
//CRCRawData.data[11][0]
//CRCRawData.data[11][1]
//CRCRawData.data[11][2]
//CRCRawData.data[11][3]
//
//quin(&CRCRawData)
//
//CRCRawData.compared
//
//CRCRawData.dashes
//
//CRCRawData.fixed
//
//CRCRawData.ones
//
//CRCRawData.data[0][0]
//CRCRawData.data[0][1]
//CRCRawData.data[0][2]
//CRCRawData.data[0][3]
//
//CRCRawData.data[1][0]
//CRCRawData.data[1][1]
//CRCRawData.data[1][2]
//CRCRawData.data[1][3]
//
//CRCRawData.data[2][0]
//CRCRawData.data[2][1]
//CRCRawData.data[2][2]
//CRCRawData.data[2][3]
//
//CRCRawData.data[3][0]
//CRCRawData.data[3][1]
//CRCRawData.data[3][2]
//CRCRawData.data[3][3]
//
//CRCRawData.data[4][0]
//CRCRawData.data[4][1]
//CRCRawData.data[4][2]
//CRCRawData.data[4][3]
//
//CRCRawData.data[5][0]
//CRCRawData.data[5][1]
//CRCRawData.data[5][2]
//CRCRawData.data[5][3]
//
//CRCRawData.data[6][0]
//CRCRawData.data[6][1]
//CRCRawData.data[6][2]
//CRCRawData.data[6][3]
//
//CRCRawData.data[7][0]
//CRCRawData.data[7][1]
//CRCRawData.data[7][2]
//CRCRawData.data[7][3]
//
//CRCRawData.data[8][0]
//CRCRawData.data[8][1]
//CRCRawData.data[8][2]
//CRCRawData.data[8][3]
//
//CRCRawData.data[9][0]
//CRCRawData.data[9][1]
//CRCRawData.data[9][2]
//CRCRawData.data[9][3]
//
//CRCRawData.data[10][0]
//CRCRawData.data[10][1]
//CRCRawData.data[10][2]
//CRCRawData.data[10][3]
//
//CRCRawData.data[11][0]
//CRCRawData.data[11][1]
//CRCRawData.data[11][2]
//CRCRawData.data[11][3]
//
//
//
//quin(&CRCRawData)
//
//CRCRawData.compared
//
//CRCRawData.dashes
//
//CRCRawData.fixed
//
//CRCRawData.ones
//
//CRCRawData.data[0][0]
//CRCRawData.data[0][1]
//CRCRawData.data[0][2]
//CRCRawData.data[0][3]
//
//CRCRawData.data[1][0]
//CRCRawData.data[1][1]
//CRCRawData.data[1][2]
//CRCRawData.data[1][3]
//
//CRCRawData.data[2][0]
//CRCRawData.data[2][1]
//CRCRawData.data[2][2]
//CRCRawData.data[2][3]
//
//CRCRawData.data[3][0]
//CRCRawData.data[3][1]
//CRCRawData.data[3][2]
//CRCRawData.data[3][3]
//
//CRCRawData.data[4][0]
//CRCRawData.data[4][1]
//CRCRawData.data[4][2]
//CRCRawData.data[4][3]
//
//CRCRawData.data[5][0]
//CRCRawData.data[5][1]
//CRCRawData.data[5][2]
//CRCRawData.data[5][3]
//
//CRCRawData.data[6][0]
//CRCRawData.data[6][1]
//CRCRawData.data[6][2]
//CRCRawData.data[6][3]
//
//CRCRawData.data[7][0]
//CRCRawData.data[7][1]
//CRCRawData.data[7][2]
//CRCRawData.data[7][3]
//
//
//
//quin(&CRCRawData)
//
//CRCRawData.compared
//
//CRCRawData.dashes
//
//CRCRawData.fixed
//
//CRCRawData.ones
//
//CRCRawData.data[0][0]
//CRCRawData.data[0][1]
//CRCRawData.data[0][2]
//CRCRawData.data[0][3]
//
//CRCRawData.data[1][0]
//CRCRawData.data[1][1]
//CRCRawData.data[1][2]
//CRCRawData.data[1][3]
//
//CRCRawData.data[2][0]
//CRCRawData.data[2][1]
//CRCRawData.data[2][2]
//CRCRawData.data[2][3]
//
//CRCRawData.data[3][0]
//CRCRawData.data[3][1]
//CRCRawData.data[3][2]
//CRCRawData.data[3][3]
//
//CRCRawData.data[4][0]
//CRCRawData.data[4][1]
//CRCRawData.data[4][2]
//CRCRawData.data[4][3]
//
//CRCRawData.data[5][0]
//CRCRawData.data[5][1]
//CRCRawData.data[5][2]
//CRCRawData.data[5][3]
//
//CRCRawData.data[6][0]
//CRCRawData.data[6][1]
//CRCRawData.data[6][2]
//CRCRawData.data[6][3]
//
//CRCRawData.data[7][0]
//CRCRawData.data[7][1]
//CRCRawData.data[7][2]
//CRCRawData.data[7][3]
//
//
