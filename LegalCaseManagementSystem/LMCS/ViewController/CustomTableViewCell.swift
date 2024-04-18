
import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var matterIdTxt: UILabel!
    @IBOutlet weak var caseTitleTxt: UILabel!
    @IBOutlet weak var partyNameTxt: UILabel!
    @IBOutlet weak var caseTypeTxt: UILabel!
    @IBOutlet weak var matterValueTxt: UILabel!
    @IBOutlet weak var dateOfIncidentTxt: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(matterIdTxt:String,caseTitleTxt:String,partyNameTxt:String,caseTypeTxt:String,matterValueTxt:String,dateOfIncidentTxt:String)  {
        
        self.matterIdTxt.text = matterIdTxt
        self.caseTitleTxt.text = caseTitleTxt
        self.partyNameTxt.text = partyNameTxt
        self.caseTypeTxt.text = caseTypeTxt
        self.matterValueTxt.text = matterValueTxt
        self.dateOfIncidentTxt.text = dateOfIncidentTxt

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
