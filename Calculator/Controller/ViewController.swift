//
//  ViewController.swift
//  Calculator
//
//  Created by Fiza Rasool on 28/05/2019.
//  Copyright © 2019 Fiza Rasool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        
            isFinishedTypingNumber = true
        
        guard let num = Double(displayLabel.text!) else {
            fatalError("Error converting the display label text to Double") }
            
            if let calcMethod = sender.currentTitle {
               
                calculator.setNumber(num)
               
                if let result = calculator.calculate(symbol: calcMethod) {
                    
                    
                    //let calculator = CalculatorLogic(number: num)
                    
                    displayLabel.text = String(result)
                }
                
                
                
            }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        
        //What should happen when a number is entered into the keypad
        
        
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                 displayLabel.text = numValue
                if numValue == "." {
                    displayLabel.text! = "0."
                }
                isFinishedTypingNumber = false
            } else {
                
                if let labelText = displayLabel.text {
                    if !labelText.contains(".") || numValue != "." {
                     displayLabel.text = labelText + numValue
                    }
                   
                }
               
            }
           
        }
        
    }

} //end of class

