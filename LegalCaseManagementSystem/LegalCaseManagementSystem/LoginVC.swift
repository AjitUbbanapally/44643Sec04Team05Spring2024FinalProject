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

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var loginBTN: UIButton!
    
    
    @IBOutlet weak var forgotPasswordBTN: UIButton!
    
    @IBOutlet weak var signupBTN: UIButton!
    
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
        let username = usernameTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if isValidCredentials(username: username, password: password) {
            // Login successful
            // Navigate to next view controller or perform necessary action
            print("Login successful")
            performSegue(withIdentifier: "dashboard", sender: self)
        } else {
            // Invalid credentials
            // Show error message or handle appropriately
            print("Invalid credentials")
        }
        
    }
    
    func isValidCredentials(username: String, password: String) -> Bool {
        if(username.count>0 && username.count<20) {
            return !username.isEmpty && !password.isEmpty
        }
        else{return false}}
    
    
    
    

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
