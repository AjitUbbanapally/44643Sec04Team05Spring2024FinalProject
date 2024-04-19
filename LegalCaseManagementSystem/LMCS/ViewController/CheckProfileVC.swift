import UIKit
import Eureka
import CoreML
import AudioToolbox

class CheckScoreProfileVC: FormViewController {

    var genderRecord = "Male"
    var ageRecord: Int = 18
    var criminalRecord: Bool = false
    var caseHistoryRecord: Int = 0
    var educationLevelRecord: String = ""
    var employmentStatusRecord =  "Employed"
    var incomeLevelRecord: Double = 0.0
    var legalKnowledgeRecord: Double = 0.0
    var communicationSkillsRecord: Double = 0.0
    var legalRepresentationRecord: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileScoreRecord()
    }
    
    func profileScoreRecord() {
        form +++
        LabelRow () {
            $0.title = "Fill in all the details to get the prediction on profile score."
            $0.cellStyle = .subtitle
        }.cellSetup { cell, row in
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: (cell.textLabel?.font.pointSize)!)
        }

        form +++ Section("Personal Information")

        <<< SegmentedRow<String>() {
            $0.title = "Gender"
            $0.options = ["Male", "Female"]
            $0.value = "Male"
        }.onChange { [weak self] row in
            self?.genderRecord = row.value ?? ""
        }

        <<< IntRow() {
            $0.title = "Age"
            $0.placeholder = "Enter Age"
            $0.value = 18
        }.onChange { [weak self] row in
            self?.ageRecord = row.value ?? 0
        }

        <<< SwitchRow() {
            $0.title = "Criminal Record"
        }.onChange { [weak self] row in
            self?.criminalRecord = row.value ?? false
        }

        <<< IntRow() {
            $0.title = "Case History(0 to 100)"
            $0.value = 0
            $0.placeholder = "Enter Case History"
        }.onChange { [weak self] row in
            self?.caseHistoryRecord = row.value ?? 0
        }

        form +++ Section("Educational & Employment Information")

        <<< PushRow<String>() {
            $0.title = "Education Level"
            $0.options = ["Bachelor's", "Master's", "Ph.D.", "High School"]
        }.onChange { [weak self] row in
            self?.educationLevelRecord = row.value ?? ""
        }

        <<< SegmentedRow<String>() {
            $0.title = "Employment Status"
            $0.options = ["Employed", "Unemployed"]
            $0.value = "Employed" // Set default value to Employed
        }.onChange { [weak self] row in
            self?.employmentStatusRecord = row.value ?? ""
        }

        <<< DecimalRow() {
            $0.title = "Income"
            $0.value = 0.0
            $0.placeholder = "Enter Income Level"
        }.onChange { [weak self] row in
            self?.incomeLevelRecord = row.value ?? 0.0
        }

        form +++ Section("Skills & Knowledge")

        <<< SliderRow() {
            $0.title = "Legal Knowledge"
            $0.value = 0.0
        }.cellSetup { cell, row in
            cell.slider.minimumValue = 0.0
            cell.slider.maximumValue = 100.0
        }.onChange { [weak self] row in
            self?.legalKnowledgeRecord = Double(row.value ?? 0.0)
        }

        <<< SliderRow() {
            $0.title = "Communication Skills"
            $0.value = 0.0
        }.cellSetup { cell, row in
            cell.slider.minimumValue = 0.0
            cell.slider.maximumValue = 100.0
        }.onChange { [weak self] row in
            self?.communicationSkillsRecord = Double(row.value ?? 0.0)
        }

        <<< SwitchRow() {
            $0.title = "Legal Representation"
            $0.value = true // Set default value to true (representing legal representation)
        }.onChange { [weak self] row in
            self?.legalRepresentationRecord = row.value ?? false
        }

        form +++ Section("Actions")

        <<< ButtonRow() {
            $0.title = "Predict"
        }
        .onCellSelection { cell, row in
            row.section?.form?.validate()
            self.recordForSocrePredict()
        }

        <<< ButtonRow() {
            $0.title = "Clear"
        }
        .onCellSelection { [weak self] cell, row in
            self?.form.removeAll()
            self?.resetprofileScoreRecord()
            self?.profileScoreRecord()
            print("Clear")
        }
    }

    func resetprofileScoreRecord(){
        self.genderRecord = ""
        self.ageRecord = 0
        self.criminalRecord = false
        self.caseHistoryRecord = 0
        self.educationLevelRecord = ""
        self.employmentStatusRecord = ""
        self.incomeLevelRecord = 0.0
        self.legalKnowledgeRecord = 0.0
        self.communicationSkillsRecord = 0.0
        self.legalRepresentationRecord = false
    }

    func recordForSocrePredict() {
        form.validate()
        
     
        if ageRecord == 0  {
            showAlertView(message: "Please add age")
            return
        }
        
        if(educationLevelRecord.isEmpty) {
           showAlertView(message: "Please add education")
           return
        }
        
        var crimanlRecord = "False"
        if (criminalRecord == true) {
            crimanlRecord = "True"
        }
        
        var legalRepresentation = "False"
        if (legalRepresentationRecord == true) {
            legalRepresentation = "True"
        }
        
      print(incomeLevelRecord)
        
        let lmcs = try! LeagalApp(configuration: MLModelConfiguration())

        let prediction = try? lmcs.prediction(Age: Int64(ageRecord), Gender: genderRecord, Education_Level: educationLevelRecord, Employment_Status: employmentStatusRecord, Income_Level: Int64(incomeLevelRecord), Criminal_Record: crimanlRecord, Case_History: Int64(caseHistoryRecord), Legal_Knowledge: Int64(legalKnowledgeRecord), Communication_Skills: Int64(communicationSkillsRecord), Legal_Representation: legalRepresentation)
        
         let score = prediction?.Profile_Score
         profilePredicationAlert(with: "\(score!)")
         AudioServicesPlaySystemSound(1152)
    }


    func profilePredicationAlert(with prediction: String) {
        let titleAlert = "Prediction"
        let message = "Profile Status: \(prediction)"

        let controller = UIAlertController(title: titleAlert, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)

        present(controller, animated: true, completion: nil)
    }
}
