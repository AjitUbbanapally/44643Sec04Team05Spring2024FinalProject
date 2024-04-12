//
//  LoginVC.swift
//
//
//  Created by ajit hk 
//

import UIKit
import Lottie


class LoginVC: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loggg: UILabel!
    @IBOutlet var rememberMeButton: UIButton!
    
    
//    @IBOutlet weak var launchLAV: LottieAnimationView!
//    
//    {
//        didSet {
//            
//            launchLAV.animation = LottieAnimation.named("Legal lottie")
//            launchLAV.alpha=1
//            
//            launchLAV.play{[weak self] _ in
//                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0.0, options: [.curveEaseInOut]){
//                    self?.launchLAV.alpha = 0.0
//                    
//                }
//            }
//        }
//        
//    }
    
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
            print("User wants the credentials to be stored for faster access.")
        } else {
            print("User does not want to be remembered.")
        }
    }
    
    @IBAction func onLoggingIn(_ sender: Any) {
        if(email.text!.isEmpty) {
            showAlerOnTop(message: "Please enter your valid email id.")
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
