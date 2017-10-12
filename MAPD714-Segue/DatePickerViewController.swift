
import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)
        
        
    }
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let date = datePicker.date
        
        let message = "The data and time you selected is \(date)"
        
        let alert = UIAlertController(
            title: "Date and Time Selected" ,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "That's so True!",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}
