
import UIKit

class PartyTableViewCell: UITableViewCell {
    @IBOutlet weak var partyNameTxt: UILabel!
    @IBOutlet weak var numberOfConvictedFeloniesTxt: UILabel!
    @IBOutlet weak var phoneTxt: UILabel!
    @IBOutlet weak var emailTxt: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(numberOfConvictedFeloniesTxt:String,phoneTxt:String,partyNameTxt:String,emailTxt:String)  {
        
        self.numberOfConvictedFeloniesTxt.text = numberOfConvictedFeloniesTxt
        self.phoneTxt.text = phoneTxt
        self.partyNameTxt.text = partyNameTxt
        self.emailTxt.text = emailTxt
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}