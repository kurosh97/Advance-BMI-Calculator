import UIKit
import os.log



class CalculateViewController: UIViewController, UITextFieldDelegate {


    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
   
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var personHistory = [Person]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.personNameTextField.delegate = self
    }

   // MARK: doesnt allow user to enter numbers
    func textField(_ personNameTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    
    }
    
  
    
    // MARK: sliders values
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    
    //MARK: calculate button
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let heightAgain = (heightSlider.value * 10).rounded() / 10
        let weightAgain = (weightSlider.value * 10).rounded() / 10
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
       
    
        
        // MARK: alert if the textfield is empy
          // create the alert
               let alert = UIAlertController(title: "Error!", message: "Please enter your name", preferredStyle: .alert)
               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               // show the alert
               if personNameTextField.text!.isEmpty{
                   self.present(alert, animated: true, completion: nil)
               }else{
                   self.performSegue(withIdentifier: "goToResult", sender: self)
               }
       
        
        let newPerson = Person(name: "Name: \(personNameTextField.text!)", height: "Height: \(heightAgain)m", weight: "Height: \(weightAgain)Kg", bmi: "BMI: \(calculatorBrain.getBMIValue())")
        personHistory.append(newPerson!)
    }

     //MARK: - Navigation

    
    
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.name = personNameTextField.text!
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
           
           
        
        }
    
    
      if segue.destination is PersonTableViewController {
                           let vc = segue.destination as? PersonTableViewController
                           
                           vc?.history = personHistory
                       }
    
    }

}

