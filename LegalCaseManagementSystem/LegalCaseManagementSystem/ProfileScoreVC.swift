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
        if(partyName.text==null){
            gender.isEnabled=false
            dateofbirth.isEnabled=false
            ssn.isEnabled=false
            casetype.isEnabled=false
            noOfConvictedFelonies.isEnabled=false
        }else{
            partyName.isEnabled=true
        }
        
       
        var model: YourCoreMLModelClass?

            override func viewDidLoad() {
                super.viewDidLoad()

             
                if let modelURL = Bundle.main.url(forResource: "YourCoreMLModel", withExtension: "mlmodelc") {
                    do {
                        model = try YourCoreMLModelClass(contentsOf: modelURL)
                       
                        makePrediction()
                    } catch {
                        print("Error loading CoreML model: \(error.localizedDescription)")
                    }
                } else {
                    print("CoreML model file not found.")
                }
            }

            func makePrediction() {
              
                if let model = model {
                    do {
                        let inputData = YourInputDataStruct()
                        let prediction = try model.prediction(input: inputData)
                        print("Prediction result: \(prediction)")
                    } catch {
                        print("Error making prediction: \(error.localizedDescription)")
                    }
                } else {
                    print("CoreML model is nil.")
                }
            }
        }
        
        
        
        
     
                
            

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
