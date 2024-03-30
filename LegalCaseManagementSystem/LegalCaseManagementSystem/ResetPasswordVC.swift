//
//  ResetPasswordVC.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 28/03/24.
//

import UIKit

class ResetPasswordVC: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var backtologinBTN: UIButton!
    
    @IBOutlet weak var cancelBTN: UIButton!
    
    @IBOutlet weak var repasswordTF: UITextField!{
        didSet{
            if((passwordTF) != nil){
                repasswordTF.isEnabled = true
                repasswordTF.isHidden = false
        }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.isEnabled = true
        passwordTF.isEnabled = true
        repasswordTF.isEnabled = false
        // Do any additional setup after loading the view.
        
        backtologinBTN.isEnabled = false
        cancelBTN.isEnabled = false
        repasswordTF.isHidden = true
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
