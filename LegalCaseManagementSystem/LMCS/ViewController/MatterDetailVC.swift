
import UIKit

class MatterDetailVC: UIViewController {
    @IBOutlet weak var dateOfIncidentTxt: UITextField!
    @IBOutlet weak var caseTypeTxt: UITextField!
    @IBOutlet weak var caseDescriptionTxtView: UILabel!
    @IBOutlet weak var statuteOfLimitationsDateTxt: UITextField!
    @IBOutlet weak var matterValueTxt: UITextField!
    @IBOutlet weak var attorneyFeesTxt: UITextField!
    @IBOutlet weak var courtNameTxt: UITextField!
    @IBOutlet weak var matterIdTxt: UITextField!
    @IBOutlet weak var caseTitleTxt: UITextField!
    @IBOutlet weak var partyNameTxt: UITextField!
    
    var caseData : CaseDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dateOfIncidentTxt.text = "Date Of Incident - \(caseData?.dateOfIncident ?? "")"
        self.caseTypeTxt.text = "Case Type - \(caseData?.caseType ?? "")"
        self.caseDescriptionTxtView.text = "Case Description - \(caseData?.caseDescription ?? "")"
        self.statuteOfLimitationsDateTxt.text = "Statute Of Limitations Date - \(caseData?.statuteOfLimitationsDate ?? "")"
        self.matterValueTxt.text = "Matter Value - \(caseData?.matterValue ?? "")"
        self.attorneyFeesTxt.text = "Attorney Fees - \(caseData?.attorneyFees ?? "")"
        self.courtNameTxt.text = "Court Name - \(caseData?.courtName ?? "")"
        self.matterIdTxt.text = "Matter Id - \(caseData?.matterId ?? "")"
        self.caseTitleTxt.text = "Case Title - \(caseData?.caseTitle ?? "")"
        self.partyNameTxt.text = "Party Name - \(caseData?.partyName ?? "")"
    }

}
