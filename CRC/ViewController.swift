//
//  ViewController.swift
//  CRC
//
//  Created by Anton Kapuhs on 07.01.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frameInput: UILabel!
    @IBOutlet weak var generatorInput: UILabel!
    @IBOutlet weak var switchButtonLable: UIButton!
    
    var frame = int_fast32_t(0)
    var aktivLable = true
    
    @IBAction func switchFrameGenerator(sender: AnyObject)
    {
        aktivLable = !aktivLable
        if(aktivLable == true)
        {
            frameInput.textColor = UIColor.blueColor()
            generatorInput.textColor = UIColor.blackColor()
            switchButtonLable.setTitle("Change to Generator", forState: .Normal)
        }else{
            frameInput.textColor = UIColor.blackColor()
            generatorInput.textColor = UIColor.blueColor()
            switchButtonLable.setTitle("Change to Frame", forState: .Normal)
        }
    }
    
    @IBAction func oneButton(sender: AnyObject)
    {
    }
    
    @IBAction func zeroButton(sender: AnyObject)
    {
    }
    
    @IBAction func calculateButton(sender: AnyObject)
    {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

