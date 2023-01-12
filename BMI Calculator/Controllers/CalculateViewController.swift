//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var labelKilo: UILabel!
    @IBOutlet weak var labelMeter: UILabel!
    @IBOutlet weak var sliderMeter: UISlider!
    @IBOutlet weak var sliderKilo: UISlider!
    var calculatorBrain = CalculatorBrain( )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderChangeKilo(_ sender: UISlider) {
        labelKilo.text = "\(calculatorBrain.convert(num: sender.value))kg"
    }
    
    @IBAction func sliderChangeMeter(_ sender: UISlider) {
        labelMeter.text = "\(calculatorBrain.convert(num: sender.value))m"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let meter = sliderMeter.value
        let kilo = sliderKilo.value
        calculatorBrain.calculate(kilo: kilo, meter:meter)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getHasil()
            destinationVC.adviceValue = calculatorBrain.getAdvice()
            destinationVC.colorValue = calculatorBrain.getColor()
        }
    }
}



