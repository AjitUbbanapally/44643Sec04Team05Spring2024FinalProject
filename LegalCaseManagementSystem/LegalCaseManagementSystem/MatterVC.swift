//
//  MatterVC.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 07/03/24.
//

import UIKit
import Eureka

class MatterVC: FormViewController {
    
    
    @IBOutlet weak var ClientTableView: UITableView!
    
    var client  = ["Matter1","Matter2","Matter3","Matter4"]
    

    

        // Do any additional setup after loading the view.
        
        //ClientTableView.delegate = self
      //  ClientTableView.dataSource = self
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newForm()
        
    }
    
    func newForm(){
            
            form +++ Section()
                   
                   <<< LabelRow() {
                       $0.title = "The details of matters"
                       $0.cellUpdate { cell, row in
                                       cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
                                       cell.textLabel?.numberOfLines = 0
                                       cell.textLabel?.textAlignment = .center
                                   }
                   }
                   
                   +++ Section("ADMISSION FACTORS")
                   
        <<< SliderRow("GRE") {
                           $0.title = "GRE Score"
                           $0.value = 0.0
                           $0.cell.slider.minimumValue = 260.0
                           $0.cell.slider.maximumValue = 340.0
                           $0.cell.slider.value = 5
                       }
                       
                       <<< SliderRow("TOEFL") {
                           $0.title = "TOEFL Score"
                           $0.value = 0.0
                           $0.cell.slider.minimumValue = 0.0
                           $0.cell.slider.maximumValue = 120.0
                           $0.cell.slider.value = 5
                       }
                       
                      
                       
                       <<< SegmentedRow<String>("UniversityRating") {
                           $0.title = "University Rating"
                           $0.options = ["1", "2", "3", "4", "5"]
                           $0.value = "1"
                       }
                       
                       <<< SegmentedRow<String>("SOP") {
                           $0.title = "SOP"
                           $0.options = ["1", "2", "3", "4", "5"]
                           $0.value = "1"
                       }
                       
                       <<< SegmentedRow<String>("LOR") {
                           $0.title = "LOR"
                           $0.options = ["1", "2", "3", "4", "5"]
                           $0.value = "1"
                       }
                
                      <<< SliderRow("CGPA") {
                           $0.title = "CGPA"
                           $0.value = 0.0
                           $0.cell.slider.minimumValue = 0.0
                           $0.cell.slider.maximumValue = 10.0
                       }
                       
        
                   
                   <<< SwitchRow("ResearchInterests") {
                       $0.title = "Research"
                       $0.value = false
                   }
                   
                   +++ Section("ACTIONS")
                   
                   <<< ButtonRow() {
                       $0.title = "Predict"
                       $0.onCellSelection { cell, row in
                           self.predictprobabilityAdmissionAcceptance()
                       }
                   }
                   
                   <<< ButtonRow() {
                       $0.title = "Clear"
                       $0.onCellSelection { cell, row in
                           self.resetForm()
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


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you selected one of the cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return client.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ClientTableView.dequeueReusableCell(withIdentifier: ClientCell, for: <#T##IndexPath#>)
        cell.textLabel?.text = client[indexPath.row]
        return cell
    }
    
    
}



