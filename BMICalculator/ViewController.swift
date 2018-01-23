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
    @IBOutlet weak var WeightTextFiled: UITextField!
    @IBOutlet weak var HeightTextField: UITextField!
    @IBOutlet weak var WeightSlider: UISlider!
    @IBOutlet weak var HeightSlider: UISlider!
    @IBOutlet weak var Background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeightTextFiled.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        HeightTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func WeightSlider(_ sender: UISlider) {
        let currentWeight = Double(sender.value)
        WeightTextFiled.text = String(format: "%.1f", currentWeight)
        calculate()
    }
    
    @IBAction func HeightSlider(_ sender: UISlider) {
        let currentHeight = Double(sender.value)
        HeightTextField.text = String(format: "%.1f", currentHeight)
        calculate()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.tag == 1 {
            if let value = Float(WeightTextFiled.text!){
                WeightSlider.setValue(value, animated: true)
            }
        } else {
            if let value = Float(HeightTextField.text!){
                HeightSlider.setValue(value, animated: true)
            }
        }
        calculate()
    }
    
    func calculate() {
        if let weight = Double(WeightTextFiled.text!), let height = Double(HeightTextField.text!) {
            if weight != 0, height != 0 {
                let result = String(format: "%.1f", weight/pow((height/100), 2))
                BMIValue.text = result
                changeStage(BMI: result)
            } else {
                updateStage(stage: "default")
            }
        } else if WeightTextFiled.text == "" || HeightTextField.text == "" {
            updateStage(stage: "default")
        } else {
            updateStage(stage: "Error")
        }
    }
    
    func changeStage(BMI:String) {
        if let bmi:Double = Double(BMI) {
            if bmi <= 18.5 {
                updateStage(stage: "Underweight")
            } else if bmi <= 24.29 {
                updateStage(stage: "Healthy")
            } else if bmi <= 29.9 {
                updateStage(stage: "Overweight")
            } else {
                updateStage(stage: "Obese")
            }
        }
    }
    
    func updateStage(stage:String) {
        if stage == "Error" {
            stageLabel.text = "BMI Calculator"
            BMIValue.text = "Error"
            ImageView.image = UIImage(named: "Logo")
            Background.backgroundColor =  UIColor(red: 0.102,
                                                  green: 0.2902,
                                                  blue: 0.4392,
                                                  alpha: 1)
        }else if stage == "Underweight" {
            stageLabel.text = "Underweight"
            ImageView.image = UIImage(named: "Underweight")
            Background.backgroundColor =  UIColor(red: 0.1529,
                                                  green: 0.9686,
                                                  blue: 0.7765,
                                                  alpha: 1)
        }else if stage == "Healthy" {
            stageLabel.text = "Healthy"
            ImageView.image = UIImage(named: "Healthy")
            Background.backgroundColor =  UIColor(red: 0.1373,
                                                  green: 0.8667,
                                                  blue: 0.3216,
                                                  alpha: 1)
        }else if stage == "Overweight" {
            stageLabel.text = "Overweight"
            ImageView.image = UIImage(named: "Overweight")
            Background.backgroundColor =  UIColor(red: 0.9098,
                                                  green: 0.7686,
                                                  blue: 0.1451,
                                                  alpha: 1)
        }else if stage == "Obese" {
            stageLabel.text = "Obese"
            ImageView.image = UIImage(named: "Obese")
            Background.backgroundColor =  UIColor(red: 0.8392,
                                                  green: 0.1333,
                                                  blue: 0.1333,
                                                  alpha: 1)
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

