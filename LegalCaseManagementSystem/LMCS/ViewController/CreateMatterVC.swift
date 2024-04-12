//
//  CreateMatterVC.swift
//  LMCS
//
//  Created by Macbook-Pro on 04/04/24.
//

import UIKit

class CreateMatterVC: UIViewController {
    @IBOutlet weak var dateOfIncidentTxt: UITextField!
    @IBOutlet weak var caseTypeTxt: UITextField!
    @IBOutlet weak var caseDescriptionTxtView: UITextField!
    @IBOutlet weak var statuteOfLimitationsDateTxt: UITextField!
    @IBOutlet weak var matterValueTxt: UITextField!
    @IBOutlet weak var attorneyFeesTxt: UITextField!
    @IBOutlet weak var attorneyAssignedPicker: UIPickerView!
    @IBOutlet weak var paralegalPicker: UIPickerView!
    @IBOutlet weak var courtNameTxt: UITextField!
    @IBOutlet weak var matterIdTxt: UITextField!
    @IBOutlet weak var caseTitleTxt: UITextField!
    @IBOutlet weak var partyNameTxt: UITextField!

    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.maximumDate = Date()
        self.dateOfIncidentTxt.inputView =  datePicker
        self.statuteOfLimitationsDateTxt.inputView = datePicker
        self.showDatePicker()
    }
    
    @IBAction func clickOnMatter(_ sender: Any) {
        if validateFields() {
            let caseDetails = CaseDetails(
                dateOfIncident: dateOfIncidentTxt.text ?? "",
                caseType: caseTypeTxt.text ?? "",
                caseDescription: caseDescriptionTxtView.text ?? "",
                statuteOfLimitationsDate: statuteOfLimitationsDateTxt.text ?? "",
                matterValue: matterValueTxt.text ?? "",
                attorneyFees: attorneyFeesTxt.text ?? "0.0",
                attorneyAssigned: "", // You'll need to set these values based on the pickers
                paralegal: "",        // You'll need to set these values based on the pickers
                courtName: courtNameTxt.text ?? "",
                matterId: matterIdTxt.text  ?? "",
                caseTitle: caseTitleTxt.text ?? "",
                partyName: partyNameTxt.text ?? "",
                userId: UserDefaultsManager.shared.getDocumentId()
            )
            
            FireStoreManager.shared.addCaseToFirestore(caseDetails) { success in
                if success{
                    showAlertView(message: "Case matter created successfully")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    func validateFields() -> Bool {
        
        guard let caseTitle = caseTitleTxt.text, !caseTitle.isEmpty else {
            showAlertView(message: "Please enter case title")
            return false
        }
        
        guard let caseType = caseTypeTxt.text, !caseType.isEmpty else {
            showAlertView(message: "Please enter case type")
            return false
        }
        
        guard let partyName = partyNameTxt.text, !partyName.isEmpty else {
            showAlertView(message: "Please enter party name")
            return false
        }
        
        guard let dateOfIncident = dateOfIncidentTxt.text, !dateOfIncident.isEmpty else {
            showAlertView(message: "Please select date of incident")
            return false
        }
        
        guard let caseDescription = caseDescriptionTxtView.text, !caseDescription.isEmpty else {
            showAlertView(message: "Please enter case description")
            return false
        }
        
        guard let statuteOfLimitationsDate = statuteOfLimitationsDateTxt.text, !statuteOfLimitationsDate.isEmpty else {
            showAlertView(message: "Please enter statue of limitation")
            return false
        }
        
        guard let matterValueString = matterValueTxt.text, let matterValue = Double(matterValueString), matterValue > 0 else {
            showAlertView(message: "Please enter matter value")
            return false
        }
        
        guard let attorneyFeesString = attorneyFeesTxt.text, let attorneyFees = Double(attorneyFeesString), attorneyFees >= 0 else {
            showAlertView(message: "Please enter attorney fees")
            return false
        }
        
        guard let courtName = courtNameTxt.text, !courtName.isEmpty else {
            showAlertView(message: "Please enter court name")
            return false
        }
        
        guard let matterId = matterIdTxt.text, !matterId.isEmpty else {
            showAlertView(message: "Please enter matter id")
            return false
        }
                
        return true
    }
}

extension CreateMatterVC {
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
        
        dateOfIncidentTxt.inputAccessoryView = toolbar
        dateOfIncidentTxt.inputView = datePicker
        
        statuteOfLimitationsDateTxt.inputAccessoryView = toolbar
        statuteOfLimitationsDateTxt.inputView = datePicker
        
    }
    
    @objc func doneHolydatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        if dateOfIncidentTxt.isFirstResponder {
            dateOfIncidentTxt.text = formatter.string(from: datePicker.date)
        } else if statuteOfLimitationsDateTxt.isFirstResponder {
            statuteOfLimitationsDateTxt.text = formatter.string(from: datePicker.date)
        }
        
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
}



