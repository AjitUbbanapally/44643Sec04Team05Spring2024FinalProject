
import UIKit

class PartyTableViewCell: UITableViewCell {
    @IBOutlet weak var partyNameTxt: UILabel!
    @IBOutlet weak var numberOfConvictedFeloniesTxt: UILabel!
    @IBOutlet weak var phoneTxt: UILabel!
    @IBOutlet weak var emailTxt: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(numberOfConvictedFeloniesTxt:String,partyNameTxt:String,emailTxt:String)  {
        
        self.numberOfConvictedFeloniesTxt.text = numberOfConvictedFeloniesTxt
        //self.phoneTxt.text = phoneTxt
        self.partyNameTxt.text = partyNameTxt
        self.emailTxt.text = emailTxt
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
