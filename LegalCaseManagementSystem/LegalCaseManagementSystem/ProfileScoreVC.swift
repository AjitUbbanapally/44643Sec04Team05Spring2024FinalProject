//
//  ProfileScoreVC.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 07/03/24.
//

import UIKit
import CoreML

class ProfileScoreVC: UIViewController {

    @IBOutlet weak var partyName: UITextField!
    
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var dateofbirth: UITextField!
    
    @IBOutlet weak var ssn: UITextField!
    
    @IBOutlet weak var casetype: UITextField!
    
    
    @IBOutlet weak var noOfConvictedFelonies: UITextField!
    
    
    @IBOutlet weak var defendantOrPlaintiff: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partyName.isEnabled=true
        gender.isEnabled=true
        dateofbirth.isEnabled=true
        ssn.isEnabled=true
        casetype.isEnabled=true
        noOfConvictedFelonies.isEnabled=true
        defendantOrPlaintiff.isEnabled=true
        
        
     
                
            

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
