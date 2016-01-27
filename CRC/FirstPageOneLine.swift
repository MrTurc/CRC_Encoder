//
//  FirstPageOneLine.swift
//  CRC
//
//  Created by Anton Kapuhs on 27.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class FirstPageOneLine: UIViewController {
    
    var generatorFirst = true
    var massegeFirst = true

    
    @IBOutlet weak var massegeLable: UILabel!
    @IBOutlet weak var generatorLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        massage.removeAll()
        generator.removeAll()
        massegeLable.text = "Massege"
        generatorLable.text = "Generator"
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func calculateCRCanNextpage(sender: AnyObject) {
        k = generator.count-1
        m = massage.count-1
        n = k + m
        generatedMassage = oneLineCRC(massage,genrator: generator,k: k)
    }

    @IBAction func massegeZeroButton(sender: AnyObject) {
        if(massegeFirst){
            massegeLable.text = "0"
            massegeFirst = false
        }else{
            massegeLable.text = massegeLable.text! + "0"
        }
        massage.insert(true, atIndex: 0)
    }
    
    @IBAction func massegeOneButton(sender: AnyObject) {
        if(massegeFirst){
            massegeLable.text = "1"
            massegeFirst = false
        }else{
            massegeLable.text = massegeLable.text! + "1"
        }
        massage.insert(false, atIndex: 0)
    }
    
    @IBAction func massegeDeletButton(sender: AnyObject) {
        if(massage.count > 0){
            massage.removeFirst()
            massegeLable.text = ""
            for(var i = massage.count-1; i >= 0;i--){
                if(massage[i]){
                    massegeLable.text = massegeLable.text! + "0"
                }else{
                    massegeLable.text = massegeLable.text! + "1"
                }
            }
        }else{
            massegeFirst = true
        }
    }

    @IBAction func generatorZeroButton(sender: AnyObject) {
        if(generatorFirst){
            generatorLable.text = "0"
            generatorFirst = false
        }else{
            generatorLable.text = generatorLable.text! + "0"
        }
        generator.insert(true, atIndex: 0)
    }
    
    @IBAction func generatorOneButton(sender: AnyObject) {
        if(generatorFirst){
            generatorLable.text = "1"
            generatorFirst = false
        }else{
            generatorLable.text = generatorLable.text! + "1"
        }
        generator.insert(false, atIndex: 0)
    }
    
    @IBAction func generatorDeletButton(sender: AnyObject) {
        if(generator.count > 0){
            generator.removeFirst()
            generatorLable.text = ""
            for(var i = generator.count-1; i >= 0;i--){
                if(generator[i]){
                    generatorLable.text = generatorLable.text! + "0"
                }else{
                    generatorLable.text = generatorLable.text! + "1"
                }
            }
        }else{
            generatorFirst = true
        }
    }
    
}
