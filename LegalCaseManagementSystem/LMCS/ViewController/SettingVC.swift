
import UIKit
import MapKit
import AVFoundation

class SettingVC: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var userType: UITextField!
    @IBOutlet weak var barId: UITextField!
    @IBOutlet weak var billingAddress: UITextField!
    var globalPicker = GlobalPicker()

    let datePicker = UIDatePicker()
    var userTypeArr = ["Paralegals", "Admin", "Lawyers"]
    var pass = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenuButton()
        self.getProfileData()
        datePicker.maximumDate = Date()
        self.dob.inputView =  datePicker
        self.showDatePicker()

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
    
    @IBAction func onLocation(_ sender: Any) {
        let mapKit = MapKitSearchViewController(delegate: self)
        mapKit.modalPresentationStyle = .fullScreen
        present(mapKit, animated: true, completion: nil)
    }
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    @objc func menuButtonTapped() {
        guard let splitViewController = splitViewController else { return }
        SplitViewControllerUtility.toggleMasterView(for: splitViewController)
        AudioServicesPlaySystemSound(SystemSoundID(1105))
    }
    
    func getProfileData(){
        FireStoreManager.shared.dbRef.document(UserDefaultsManager.shared.getDocumentId()).getDocument { (document, error) in
            if let error = error {
                
            } else {
                if let document = document, document.exists {
                    if let data = document.data() {
                        self.name.text = data["name"] as? String ?? ""
                        self.phone.text = data["phone"] as? String ?? ""
                        self.barId.text = data["barId"] as? String ?? ""
                        self.userType.text = data["userType"] as? String ?? ""
                        self.dob.text = data["dob"] as? String ?? ""
                        self.pass = data["password"] as? String ?? ""
                        self.billingAddress.text = data["billingAddress"] as? String ?? ""
                    }
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    @IBAction func onEdit(_ sender: Any) {
        
            if validate() {
                let documentid = UserDefaultsManager.shared.getDocumentId()
                            
                let userData = UserRegistrationModel(name: self.name.text?.lowercased() ?? "", email: UserDefaultsManager.shared.getEmail(), dob: self.dob.text ?? "", phone: self.phone.text ?? "", password: self.pass, userType: self.userType.text ?? "", barId: self.barId.text ?? "", billingAddress: self.billingAddress.text ?? "")
                
                FireStoreManager.shared.updateProfile(documentid: documentid, user: userData) { success in
                    if success {
                        showAlerOnTop(message: "Profile Updated Successfully")
                    }
                    AudioServicesPlaySystemSound(SystemSoundID(1103))
                }
            }
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
    
    @IBAction func onLogout(_ sender: Any) {
        UserDefaultsManager.shared.clearUserDefaults()
        UserDefaults.standard.removeObject(forKey: "documentId")
        SceneDelegate.shared!.loginCheckOrRestart()
        AudioServicesPlaySystemSound(SystemSoundID(1100))
    }
}

extension SettingVC {
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

extension SettingVC: MapKitSearchDelegate {
    func mapKitSearch(_ mapKitSearchViewController: MapKitSearchViewController, mapItem: MKMapItem) {
    }
    
    func mapKitSearch(_ mapKitSearchViewController: MapKitSearchViewController, searchReturnedOneItem mapItem: MKMapItem) {
    }
    
    func mapKitSearch(_ mapKitSearchViewController: MapKitSearchViewController, userSelectedListItem mapItem: MKMapItem) {
    }
    
    func mapKitSearch(_ mapKitSearchViewController: MapKitSearchViewController, userSelectedGeocodeItem mapItem: MKMapItem) {
    }
    
    func mapKitSearch(_ mapKitSearchViewController: MapKitSearchViewController, userSelectedAnnotationFromMap mapItem: MKMapItem) {
        print(mapItem.placemark.address)
        
        mapKitSearchViewController.dismiss(animated: true)
        self.setAddress(mapItem: mapItem)
    }
    
    
    func setAddress(mapItem: MKMapItem) {
        
        self.billingAddress.text = mapItem.placemark.mkPlacemark!.description.removeCoordinates()
        
    }
    
}
