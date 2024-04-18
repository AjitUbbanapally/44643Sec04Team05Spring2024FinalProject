
import UIKit
import AVFoundation

class ProfileScoreVC: UIViewController {
    @IBOutlet weak var partyNameTxt: UITextField!
    @IBOutlet weak var dateOfBirthTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var ssnTxt: UITextField!
    @IBOutlet weak var caseTypeTxt: UITextField!
    @IBOutlet weak var numberOfConvictedFeloniesTxt: UITextField!
    @IBOutlet weak var defendantOrPlaintiffTxt: UITextField!
    @IBOutlet weak var educationalLevelTxt: UITextField!
    @IBOutlet weak var employmentStatusTxt: UITextField!
    var globalPicker = GlobalPicker()
    var genderGlobalPicker = GlobalPicker()

    let datePicker = UIDatePicker()
    let caseTypes = [
        "Accident Case",
        "Robbery Case",
        "Assault Case",
        "Fraud Case",
        "Property Damage Case",
        "Medical Malpractice Case",
        "Contract Dispute Case",
        "Employment Discrimination Case",
        "Personal Injury Case",
        "Product Liability Case",
        "Environmental Law Case",
        "Divorce Case",
        "Child Custody Case",
        "Estate Planning Case",
        "Bankruptcy Case",
        "Criminal Defense Case",
        "Intellectual Property Case",
        "Insurance Claim Case",
        "Real Estate Dispute Case",
        "Civil Rights Case",
        "Tax Law Case"
    ]
    let gender = ["Male","Female"]

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.maximumDate = Date()
        self.dateOfBirthTxt.inputView =  datePicker
        self.showDatePicker()

        setupMenuButton()
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
    
    @IBAction func onUserType(_ sender: Any) {
                    
        var locationKey = ""
        self.globalPicker.stringArray = self.caseTypes
        
        self.globalPicker.modalPresentationStyle = .overCurrentContext
        self.globalPicker.onDone = { [self] index in
          locationKey =  globalPicker.stringArray[index]
            self.caseTypeTxt.text = locationKey
        }
        self.present(self.globalPicker, animated: true, completion: nil)
        
    }
    
    @IBAction func onGender(_ sender: Any) {
                    
        var locationKey = ""
        self.genderGlobalPicker.stringArray = self.gender
        
        self.genderGlobalPicker.modalPresentationStyle = .overCurrentContext
        self.genderGlobalPicker.onDone = { [self] index in
          locationKey =  genderGlobalPicker.stringArray[index]
            self.genderTxt.text = locationKey
        }
        self.present(self.genderGlobalPicker, animated: true, completion: nil)
        
    }
}

extension ProfileScoreVC {
    func validateFields() -> Bool {
        // Validate each text field and show an alert if any field is empty
        
        if partyNameTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter party name")
            return false
        }
        
        if dateOfBirthTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter date of birth")
            return false
        }
        
        if genderTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter gender")
            return false
        }
        
        if ssnTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter SSN")
            return false
        }
        
        if caseTypeTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter case type")
            return false
        }
        
        if numberOfConvictedFeloniesTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter number of convicted felonies")
            return false
        }
        
        if defendantOrPlaintiffTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter defendant or plaintiff")
            return false
        }
        
        if educationalLevelTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter educational level")
            return false
        }
        
        if employmentStatusTxt.text?.isEmpty ?? true {
            showAlertView(message: "Please enter employment status")
            return false
        }
        
        return true
    }

    @IBAction func clickOnProfileScore(_ sender: Any) {
        AudioServicesPlaySystemSound(SystemSoundID(1103))
        if validateFields() {
            let partyDetails = PartyDetails(
                partyName: partyNameTxt.text ?? "",
                dateOfBirth: dateOfBirthTxt.text ?? "",
                gender: genderTxt.text ?? "",
                ssn: ssnTxt.text ?? "",
                caseType: caseTypeTxt.text ?? "",
                numberOfConvictedFelonies: Int(numberOfConvictedFeloniesTxt.text ?? "") ?? 0,
                defendantOrPlaintiff: defendantOrPlaintiffTxt.text ?? "",
                educationalLevel: educationalLevelTxt.text ?? "",
                employmentStatus: employmentStatusTxt.text ?? "",
                userId: UserDefaultsManager.shared.getDocumentId(),
                userPhone: UserDefaultsManager.shared.getPhone(),
                userEmail: UserDefaultsManager.shared.getEmail()
            )
            
            FireStoreManager.shared.addProfileScoreToFirestore(partyDetails) { success, documentID in
                if success, let documentID = documentID {
                    showAlertView(message: "Party created successfully")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:  "CreateMatterVC" ) as! CreateMatterVC
                    vc.partyDocumentId = documentID
                    vc.partyName = self.partyNameTxt.text ?? ""
                    self.navigationController?.pushViewController(vc, animated: true)

                } else {
                    print("Failed to add party.")
                }
            }
        }
    }
}

extension ProfileScoreVC{
    func showDatePicker() {
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
        }
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneHolydatePicker))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker))
        cancelButton.tintColor = .black
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        dateOfBirthTxt.inputAccessoryView = toolbar
        dateOfBirthTxt.inputView = datePicker
        
    }
    
    @objc func doneHolydatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        dateOfBirthTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    
}
