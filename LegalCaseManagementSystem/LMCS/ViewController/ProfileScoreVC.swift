//
//  ProfileScoreVC.swift
//  LMCS
//
//  Created by Macbook-Pro on 04/04/24.
//

import UIKit

class ProfileScoreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
