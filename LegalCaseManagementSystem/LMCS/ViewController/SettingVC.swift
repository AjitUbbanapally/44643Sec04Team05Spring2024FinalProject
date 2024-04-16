

import UIKit
import AVFoundation

class SettingVC: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var userType: UITextField!
    @IBOutlet weak var barId: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenuButton()
        self.getProfileData()
    }
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func menuButtonTapped() {
        guard let splitViewController = splitViewController else { return }
        SplitViewControllerUtility.toggleMasterView(for: splitViewController)
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
                    }
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
    
//    @IBAction func onEdit(_ sender: Any) {
//        if !editBool {
//            self.editBtn.setTitle("Save", for: .normal)
//            self.userInteractionTrue()
//            editBool = true
//        } else {
//            if validate(){
//                let documentid = UserDefaultsManager.shared.getDocumentId()
//                            
//                let userData = UserRegistrationModel(name: self.name.text?.lowercased() ?? "", email: self.userData?.email, dob: self.dob.text ?? "", phone: self.phone.text ?? "", password: self.userData?.password, userType: self.userType.text ?? "", barId: self.barId.text ?? "")
//                
//                FireStoreManager.shared.updateProfile(documentid: documentid, user: userData) { success in
//                    if success {
//                        showAlerOnTop(message: "Profile Updated Successfully")
//                    }
//                }
//                editBool = false
//                self.editBtn.setTitle("Edit Profile Details", for: .normal)
//                self.userInteractionFalse()
//            }
//        }
//    }
    
    @IBAction func onLogout(_ sender: Any) {
        AudioServicesPlaySystemSound(SystemSoundID(1104))
        UserDefaultsManager.shared.clearUserDefaults()
        UserDefaults.standard.removeObject(forKey: "documentId")
        SceneDelegate.shared!.loginCheckOrRestart()
    }

//    func validate() ->Bool {
//        
//        if(self.name.text!.isEmpty) {
//             showAlerOnTop(message: "Please enter name.")
//            return false
//        }
//
//        if(self.phone.text!.isEmpty) {
//             showAlerOnTop(message: "Please enter phone.")
//            return false
//        }
//        
//        if(self.dob.text!.isEmpty) {
//            showAlerOnTop(message: "Please enter dob.")
//           return false
//       }
//        
//        if(self.userType.text!.isEmpty) {
//             showAlerOnTop(message: "Please enter user type.")
//            return false
//        }
//        
//        if(self.barId.text!.isEmpty) {
//             showAlerOnTop(message: "Please enter bar id.")
//            return false
//        }
////        if !isValidCode(self.barId.text ?? ""){
////            showAlerOnTop(message: "Please enter valid bar id.")
////           return false
////        }
//        return true
//    }
}

