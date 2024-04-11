//
//  LoginVC.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 07/03/24.
//

import UIKit
import AnimatedGradientView
import AVFoundation
import Lottie
import Firebase


class LoginVC: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var loginBTN: UIButton!
    
    
    @IBOutlet weak var forgotPasswordBTN: UIButton!
    
    @IBOutlet weak var signupBTN: UIButton!
    
    
    @IBOutlet weak var messageLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["# A3D256", "#A3D255"], .up, .axial),
                                            (colors: ["#A3D256", "#A3D255", "#A3D256"], .right, .axial),
                                            (colors: ["#A3D256", "#A3D256"], .down, .axial),
                                            (colors: ["#A3D256", "#A3D256", "#A3D256"], .left, .axial)]
        view.addSubview(animatedGradient)
        view.sendSubviewToBack(animatedGradient)
        
      
        usernameTF.isEnabled = true
        passwordTF.isEnabled = true
        loginBTN.isEnabled = true
        forgotPasswordBTN.isEnabled = true
        signupBTN.isEnabled = true
        
        
        
    }
    
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        AudioServicesPlaySystemSound(1103)
        // Perform login authentication
        
        guard let emailID = usernameTF.text, !emailID.isEmpty else {
                        messageLBL.text = "Please enter Username!"
                        return
                    }
         
                    guard let paswrd = passwordTF.text, !paswrd.isEmpty else {
                        messageLBL.text = "Please enter Password!"
                        return
                    }
                
                guard let emailID = usernameTF.text else { return }
                guard let pswrd = passwordTF.text else { return  }
                
//                Auth.auth().signIn(withEmail: emailID, password: pswrd){ [weak self] authResult, error in
//                    guard self != nil else { return }
//                    if let error = error {
//                        print("Login failed:", error.localizedDescription)
//                        self?.messageLBL.text = "Invalid Login Credentials! Please try again."
//                        return
//                    }
//                    self?.performSegue(withIdentifier: "loginToProducts", sender: nil)
                }
        
        
//        if isValidCredentials(username: username, password: password) {
//            // Login successful
//            // Navigate to next view controller or perform necessary action
//            print("Login successful")
//            performSegue(withIdentifier: "dashboard", sender: self)
//        } else {
//            // Invalid credentials
//            // Show error message or handle appropriately
//            print("Invalid credentials")
//        }
//        
//    }
//    
//    func isValidCredentials(username: String, password: String) -> Bool {
//        if(username.count>0 && username.count<20) {
//            return !username.isEmpty && !password.isEmpty
//        }
//        else{return false}}
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var LaunchLV: LottieAnimationView!
    
    {
        didSet{
            LaunchLV.animation = LottieAnimation.named("Legal lottie")
            LaunchLV.play{[weak self] _ in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 2.0, options: [.curveEaseInOut]){
                    self?.LaunchLV.alpha = 0.0
                }
                
                
            }
            
        }
        
        
    }
    
    

}
