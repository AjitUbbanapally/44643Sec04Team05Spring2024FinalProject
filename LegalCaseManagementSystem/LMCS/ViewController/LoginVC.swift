//
//  LoginVC.swift
//  StudentInformationExchange
//
//  Created by Macbook-Pro on 21/11/23.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loggg: UILabel!
    @IBOutlet var rememberMeButton: UIButton!
    
    var rememberMe: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rememberMeButton.setImage(UIImage(named: "check"), for: .selected)
        rememberMeButton.setImage(UIImage(named: "uncheck"), for: .normal)
        
        rememberMeButton.isSelected = rememberMe
        
    }
    
    @IBAction func rememberMeToggled(_ sender: UIButton) {
        rememberMeButton.isSelected.toggle()
        rememberMe = rememberMeButton.isSelected
        
        if rememberMe {
            print("User wants to be remembered.")
        } else {
            print("User does not want to be remembered.")
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if(email.text!.isEmpty) {
            showAlerOnTop(message: "Please enter your email id.")
            return
        }
        
        if(self.password.text!.isEmpty) {
            showAlerOnTop(message: "Please enter your password.")
            return
        }
        else{
            FireStoreManager.shared.login(email: email.text?.lowercased() ?? "", password: password.text ?? "") { success in
                if success{
                    SceneDelegate.shared?.loginCheckOrRestart()
                }
                
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "SignUpVC" ) as! SignUpVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onForgotPassword(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "ForgotPasswordVC" ) as! ForgotPasswordVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
