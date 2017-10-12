

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dependentPicker: UIPickerView!
    let stateComponent = 0
    let zipComponent = 1
    
    var stateZips:[String:[String]]!
    var states:[String]!
    var zips:[String]!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a reference to the dictionary inside the plist file
        let bundle = Bundle.main
        let plistURL = bundle.url(forResource: "statedictionary", withExtension: "plist")
        
        //read in the dictionary data from the plist file
        stateZips = NSDictionary.init(contentsOf: (plistURL)!) as! [String:[String]]
        let allStates = stateZips.keys
        states = allStates.sorted()
        let selectedStates = states[0]
        zips = stateZips[selectedStates]

        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let stateRow = dependentPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependentPicker.selectedRow(inComponent: zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        
        let title = "You selected zip code \(zip)"
        
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action  = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == stateComponent) ? states.count : zips.count    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (component == stateComponent) ? states[row]: zips[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent{
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependentPicker.reloadComponent(zipComponent)
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true)
            
        }
    }
  
}
