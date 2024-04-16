

import UIKit

class PartyDetailVC: UIViewController {
    
    @IBOutlet weak var partyNameTxt: UITextField!
    @IBOutlet weak var dateOfBirthTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var ssnTxt: UITextField!
    @IBOutlet weak var caseTypeTxt: UITextField!
    @IBOutlet weak var numberOfConvictedFeloniesTxt: UITextField!
    @IBOutlet weak var defendantOrPlaintiffTxt: UITextField!
    @IBOutlet weak var educationalLevelTxt: UITextField!
    @IBOutlet weak var employmentStatusTxt: UITextField!
    
    var partyData : PartyDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.partyNameTxt.text = "Party Name - \(partyData?.partyName ?? "")"
        dateOfBirthTxt.text = "Date Of Birth - \(partyData?.dateOfBirth ?? "")"
        genderTxt.text = "Gender - \(partyData?.gender ?? "")"
        ssnTxt.text = "SSN - \(partyData?.ssn ?? "")"
        caseTypeTxt.text = "Case Type - \(partyData?.caseType ?? "")"
        numberOfConvictedFeloniesTxt.text = "NumberOfConvictedFelonies - \(partyData?.numberOfConvictedFelonies ?? 0)"
        defendantOrPlaintiffTxt.text = "DefendantOrPlaintiff - \(partyData?.defendantOrPlaintiff ?? "")"
        educationalLevelTxt.text = "Educational Level - \(partyData?.educationalLevel ?? "")"
        employmentStatusTxt.text = "Employment Status - \(partyData?.employmentStatus ?? "")"

    }
    
    @IBAction func onCraeteMatter(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "CreateMatterVC" ) as! CreateMatterVC
        vc.partyDocumentId =  partyData?.documentID ?? ""
        vc.partyName = self.partyNameTxt.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
