

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var userType: UITextField!
    @IBOutlet weak var barId: UITextField!
    var globalPicker = GlobalPicker()

    let datePicker = UIDatePicker()

    var switchBool = true
    var userTypeArr = ["Paralegals", "Admin", "Lawyers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.maximumDate = Date()
        self.dob.inputView =  datePicker
        self.showDatePicker()
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        if validate() {

            let userData = UserRegistrationModel(name: self.name.text?.lowercased() ?? "", email: self.email.text ?? "", dob: self.dob.text ?? "", phone: self.phone.text ?? "", password: self.password.text ?? "",userType: self.userType.text ?? "", barId: self.barId.text ?? "")
            
            FireStoreManager.shared.signUp(user: userData) { success in
                if success{
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        
    }

    @IBAction func onUserType(_ sender: Any) {
                    
        var locationKey = ""
        self.globalPicker.stringArray = self.userTypeArr
        
        self.globalPicker.modalPresentationStyle = .overCurrentContext
        self.globalPicker.onDone = { [self] index in
          locationKey =  globalPicker.stringArray[index]
            self.userType.text = locationKey
        }
        self.present(self.globalPicker, animated: true, completion: nil)
        
    }
    
    func validate() ->Bool {
        
        if(self.name.text!.isEmpty) {
             showAlerOnTop(message: "Please enter name.")
            return false
        }
        
       
        if(self.email.text!.isEmpty) {
             showAlerOnTop(message: "Please enter email.")
            return false
        }
        
        if !email.text!.emailIsCorrect() {
            showAlerOnTop(message: "Please enter valid email id")
            return false
        }
        

        if(self.phone.text!.isEmpty) {
             showAlerOnTop(message: "Please enter phone number")
            return false
        }
        
        if(self.phone.text!.count < 10 ) {
            
             showAlerOnTop(message: "Please Enter valid phone number")
            return false
        }
        
        if(self.dob.text!.isEmpty) {
            showAlerOnTop(message: "Please enter dob.")
           return false
       }
              
        if(self.password.text!.isEmpty) {
             showAlerOnTop(message: "Please enter password.")
            return false
        }
        
        
        
        if(self.confirmPassword.text!.isEmpty) {
             showAlerOnTop(message: "Please enter confirm password.")
            return false
        }
        
           if(self.password.text! != self.confirmPassword.text!) {
             showAlerOnTop(message: "Password doesn't match")
            return false
        }
        
        if(self.password.text!.count < 6 || self.password.text!.count > 10 ) {
            
             showAlerOnTop(message: "Password  length should be between 6 to 10")
            return false
        }
        
        if(self.userType.text!.isEmpty) {
             showAlerOnTop(message: "Please enter user type.")
            return false
        }
        
        if(self.barId.text!.isEmpty) {
             showAlerOnTop(message: "Please enter bar id.")
            return false
        }
        
        if !isValidCode(self.barId.text ?? ""){
            showAlerOnTop(message: "Please enter valid bar id.")
           return false
        }
        return true
    }
    
    func isValidCode(_ code: String) -> Bool {
        guard code.count == 10 else { return false }
        
        let alphanumericSet = CharacterSet.alphanumerics
        
        for char in code {
            if !alphanumericSet.contains(UnicodeScalar(String(char))!) {
                return false
            }
        }
        
        return true
    }
}

extension SignUpVC {
        func showDatePicker() {
            //Formate Date
            datePicker.datePickerMode = .date
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            
            //done button & cancel button
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneHolydatePicker))
            doneButton.tintColor = .black
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker))
            cancelButton.tintColor = .black
            toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
            
            // add toolbar to textField
            dob.inputAccessoryView = toolbar
            // add datepicker to textField
            dob.inputView = datePicker
            
        }
        
        @objc func doneHolydatePicker() {
            //For date formate
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            dob.text = formatter.string(from: datePicker.date)
            //dismiss date picker dialog
            self.view.endEditing(true)
        }
        
        @objc func cancelDatePicker() {
            self.view.endEditing(true)
        }

}



