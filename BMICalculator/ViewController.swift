//
//  ViewController.swift
//  BMICalculator
//
//  Created by oatThanut on 18/1/2561 BE.
//  Copyright © 2561 oatThanut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var BMIValue: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    @IBOutlet weak var HeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func WeightSlider(_ sender: Any) {
    }
    
    @IBAction func HeightSlider(_ sender: Any) {
    }
    
    
}

