//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var code = Array<Array<Bool>>()

var massage = [Bool](arrayLiteral: false,true,false,false,false,true)

var generator = [Bool](arrayLiteral: false,true,true,false)

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

func xor(x1:Bool,x2:Bool)->Bool{
    if(x1 == x2){
        return true
    }
    return false
}

func oneLineCRC(var massege:[Bool], genrator:[Bool], k:Int)->[Bool]{
    var tmp:[Bool] = massege
    var i:Int = k+massege.count
    while(i > 0){
        if(massege[massege.count-1] == false){
            for(var n = 0; n < genrator.count;n++){
                massege[(massege.count - genrator.count + n)] = xor(massege[(massege.count - genrator.count + n)], x2: genrator[n])
            }
        }
        massege
        shiftLeft(&massege)
        i--
    }
    massege
    for(var n = massege.count; n > (massege.count-k); n--){
        tmp.insert(massege[n-1], atIndex: 0)
    }
    return tmp
}

oneLineCRC(massage, genrator: generator, k: 3)

func fullCRC(){
    
}