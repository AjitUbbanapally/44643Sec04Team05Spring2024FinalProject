

import UIKit

class SettingVC: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var userType: UITextField!
    @IBOutlet weak var barId: UITextField!
    @IBOutlet weak var editBtn: UIButton!

    var editBool = false
    let datePicker = UIDatePicker()
    
    var userData : UserRegistrationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.maximumDate = Date()
        self.dob.inputView =  datePicker
        self.showDatePicker()

        
        self.getProfileData()
        
        self.userInteractionFalse()
    }
    
    
    func userInteractionFalse(){
        
        name.isUserInteractionEnabled = false
        dob.isUserInteractionEnabled = false
        phone.isUserInteractionEnabled = false
        userType.isUserInteractionEnabled = false
        barId.isUserInteractionEnabled = false

    }

    func userInteractionTrue(){
        
        name.isUserInteractionEnabled = false
        dob.isUserInteractionEnabled = false
        phone.isUserInteractionEnabled = false
        userType.isUserInteractionEnabled = false
        barId.isUserInteractionEnabled = false

    }
    
    @IBAction func onEdit(_ sender: Any) {
        if !editBool {
            self.editBtn.setTitle("Save", for: .normal)
            self.userInteractionTrue()
            editBool = true
        } else {
            if validate(){
                let documentid = UserDefaultsManager.shared.getDocumentId()
                            
                let userData = UserRegistrationModel(name: self.name.text?.lowercased() ?? "", email: self.userData?.email, dob: self.dob.text ?? "", phone: self.phone.text ?? "", password: self.userData?.password, userType: self.userType.text ?? "", barId: self.barId.text ?? "")
                
                FireStoreManager.shared.updateProfile(documentid: documentid, user: userData) { success in
                    if success {
                        showAlerOnTop(message: "Profile Updated Successfully")
                    }
                }
                editBool = false
                self.editBtn.setTitle("Edit Profile Details", for: .normal)
                self.userInteractionFalse()
            }
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        UserDefaultsManager.shared.clearUserDefaults()
        UserDefaults.standard.removeObject(forKey: "documentId")
        SceneDelegate.shared!.loginCheckOrRestart()
    }

    func validate() ->Bool {
        
        if(self.name.text!.isEmpty) {
             showAlerOnTop(message: "Please enter name.")
            return false
        }

        if(self.phone.text!.isEmpty) {
             showAlerOnTop(message: "Please enter phone.")
            return false
        }
        
        if(self.dob.text!.isEmpty) {
            showAlerOnTop(message: "Please enter dob.")
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
//        if !isValidCode(self.barId.text ?? ""){
//            showAlerOnTop(message: "Please enter valid bar id.")
//           return false
//        }
        return true
    }
    
    
    
}


extension SettingVC {
        func showDatePicker() {
            datePicker.datePickerMode = .date
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
            }
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            
            
            
            let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker))
            cancelButton.tintColor = .black
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneHolydatePicker))
            doneButton.tintColor = .black
            
            toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
            
            // add toolbar to textField
            dob.inputAccessoryView = toolbar
            // add datepicker to textField
            dob.inputView = datePicker
            
        }
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
        
        @objc func doneHolydatePicker() {
            //For date formate
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            dob.text = formatter.string(from: datePicker.date)
            //dismiss date picker dialog
            self.view.endEditing(true)
        }
    //
    func fetchProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        guard let url = URL(string: "https://yourapi.com/profile") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check if data was received
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 1, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let profile = try decoder.decode(Profile.self, from: data)
                completion(.success(profile))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
        
      

}
