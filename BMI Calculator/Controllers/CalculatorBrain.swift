//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Andrew Indayang on 08/01/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct CalculatorBrain{
    var hasil:BMI?
    
    func convert(num:Float) ->String{
        return String(format: "%.2f", num)
    }
    
    func getHasil()->String{
        return String(format: "%.1f", hasil?.value ?? 0.0)
    }
    
    func getAdvice() -> String{
        return hasil?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor{
        return hasil?.color ?? UIColor.cyan
    }
    
    mutating func calculate(kilo:Float, meter:Float){
        let calculate = kilo / pow(meter, 2)
        if calculate < 18.5{
            hasil = BMI(value: calculate, advice: "Eat more pies!", color: UIColor.blue)
        }else if calculate < 24.9{
            hasil = BMI(value: calculate, advice: "Feat as a fiddle!", color: UIColor.red)
        }else{
            hasil = BMI(value: calculate, advice: "Eat more pies!", color: UIColor.yellow)
        }
        
    }
}
