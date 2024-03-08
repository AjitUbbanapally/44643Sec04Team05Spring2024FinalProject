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
        } else {
            // Invalid credentials
            // Show error message or handle appropriately
            print("Invalid credentials")
        }
        
    }
    
    func isValidCredentials(username: String, password: String) -> Bool {
        
        return !username.isEmpty && !password.isEmpty
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
