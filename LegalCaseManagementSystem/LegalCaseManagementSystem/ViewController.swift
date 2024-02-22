//
//  ViewController.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 18/02/24.
//

import UIKit
import AnimatedGradientView

class ViewController: UIViewController {
    
    
    @IBOutlet weak var UserNameTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["# A3D256", "#A3D256"], .up, .axial),
                                            (colors: ["#A3D256", "#A3D256", "#A3D256"], .right, .axial),
                                            (colors: ["#A3D256", "#A3D256"], .down, .axial),
                                            (colors: ["#A3D256", "#A3D256", "#A3D256"], .left, .axial)]
        view.addSubview(animatedGradient)
        view.sendSubviewToBack(animatedGradient)
        
    }
    
    
    


}

