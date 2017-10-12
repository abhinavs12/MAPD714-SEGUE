import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var doublePicker: UIPickerView!
    
    private let batsmanComponent = 0
    private let bowlerComponent = 1
    private let batsmanTypes = ["Tendulkar", "Ganguly", "Dravid", "Dhoni", "Yuvraj"]
    private let bowlerTypes = ["Kumble", "Zaheer", "Harbhajan", "Akram", "Srinath"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let batsmanRow = doublePicker.selectedRow(inComponent: batsmanComponent)
        
        let bowlerRow = doublePicker.selectedRow(inComponent: bowlerComponent)
        
        let batsman = batsmanTypes[batsmanRow]
        
        let bowler = bowlerTypes[bowlerRow]
        
        let message = "\(batsman) and \(bowler) are warmed up"
        
        let alert = UIAlertController(title: "Stars which are Warmed Up", message: message, preferredStyle: .alert)
        
        let action  = UIAlertAction(title: "You're Welcome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
         return (component == bowlerComponent) ? bowlerTypes.count : batsmanTypes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (component == bowlerComponent) ? bowlerTypes[row] : batsmanTypes[row]
    }
    
    
}
