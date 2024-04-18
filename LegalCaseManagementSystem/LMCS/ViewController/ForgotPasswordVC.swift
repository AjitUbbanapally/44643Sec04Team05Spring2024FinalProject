

import UIKit

class ForgotPasswordVC: UIViewController {
    @IBOutlet weak var email: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onSend(_ sender: Any) {
        if(email.text!.isEmpty) {
            showAlerOnTop(message: "Please enter your email id.")
            return
        }
        else{
            FireStoreManager.shared.getPassword(email: self.email.text!.lowercased(), password: "") { password in
                print(password)
            }
        }
    }


}
