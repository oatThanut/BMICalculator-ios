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
    @IBOutlet weak var Background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func WeightSlider(_ sender: UISlider) {
        let currentWeight = Double(sender.value)
        WeightLabel.text = String(format: "%.1f", currentWeight)
        calculate()
    }
    
    @IBAction func HeightSlider(_ sender: UISlider) {
        let currentHeight = Double(sender.value)
        HeightLabel.text = String(format: "%.1f", currentHeight)
        calculate()
    }
    
    func calculate() {
        if let weight = Double(WeightLabel.text!), let height = Double(HeightLabel.text!) {
            if weight != 0, height != 0 {
                let result = String(format: "%.1f", weight/pow((height/100), 2))
                BMIValue.text = result
                changeStage(BMI: result)
            } else {
                stageLabel.text = "BMI Calculator"
                BMIValue.text = "0.0"
                ImageView.image = UIImage(named: "Logo")
                Background.backgroundColor =  UIColor(red: 0.102,
                                                      green: 0.2902,
                                                      blue: 0.4392,
                                                      alpha: 1)
            }
        }
    }
    
    func changeStage(BMI:String) {
        if let bmi:Double = Double(BMI) {
            if bmi <= 18.5 {
                stageLabel.text = "Underweight"
                ImageView.image = UIImage(named: "Underweight")
                Background.backgroundColor =  UIColor(red: 0.1529,
                                                      green: 0.9686,
                                                      blue: 0.7765,
                                                      alpha: 1)
            } else if bmi <= 24.29 {
                stageLabel.text = "Healthy"
                ImageView.image = UIImage(named: "Healthy")
                Background.backgroundColor =  UIColor(red: 0.1373,
                                                      green: 0.8667,
                                                      blue: 0.3216,
                                                      alpha: 1)
            } else if bmi <= 29.9 {
                stageLabel.text = "Overweight"
                ImageView.image = UIImage(named: "Overweight")
                Background.backgroundColor =  UIColor(red: 0.9098,
                                                      green: 0.7686,
                                                      blue: 0.1451,
                                                      alpha: 1)
            } else {
                stageLabel.text = "Obese"
                ImageView.image = UIImage(named: "Obese")
                Background.backgroundColor =  UIColor(red: 0.8392,
                                                      green: 0.1333,
                                                      blue: 0.1333,
                                                      alpha: 1)
            }
        }
    }
}

