import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDataSource , UIPickerViewDelegate{

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private let characterNames = ["Dhoni","Kohli","Tendulkar","Ganguly","Kumble","Yuvraj","Kapil","Gavaskar"]
    
    
    
    
    @IBOutlet weak var singlePicker: UIPickerView!
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row = singlePicker.selectedRow(inComponent: 0)
        
        let selected = characterNames[row]
        
        let title = "You Selected \(selected)"
        
        let alert = UIAlertController(title: title, message: "Thakyou for choosing", preferredStyle: .alert)
        
        let action  = UIAlertAction(title: "You're Welcome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //the following code makes this class comply with protocols
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }
    
    
}
