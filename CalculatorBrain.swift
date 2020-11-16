

import UIKit


struct CalculatorBrain {
      var bmi : BMI?

    func getBMIValue() -> String {
        
        let bmiToOneDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0 )
        return bmiToOneDecimalPlace
    }
   
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
  
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / (height * height)
      
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies :/", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }else if (bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "You look good :)", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat Less mate :/", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        }

    }
    
    
  
    
    
}
