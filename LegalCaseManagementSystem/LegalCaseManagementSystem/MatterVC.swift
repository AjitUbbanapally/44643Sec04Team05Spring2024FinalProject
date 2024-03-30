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
                       $0.title = "The details of Matters with Legal attorney"
                       $0.cellUpdate { cell, row in
                                       cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
                                       cell.textLabel?.numberOfLines = 0
                                       cell.textLabel?.textAlignment = .center
                                   }
                   }
                   
                   +++ Section("MATTER")
                   
        <<< SliderRow("Matters") {
                           $0.title = "Matter Id"
                           $0.value = 0.0
                           
                           
                       }
                       
                       
                       <<< SegmentedRow<String>("Case Type") {
                           $0.title = "Case Title"
                           $0.options = ["ip", "insolvency", "property", "arbitration", "LLP"]
                           $0.value = "1"
                       }
                       <<< SegmentedRow<String>("Matter Value ") {
                           $0.title = "Matter monetary Value"
                           $0.value = "1"
                       }
                       
                       
                
                      <<< ButtonRow() {
                       $0.title = "Date of Incident"
                       $0.onCellSelection { cell, row in
                           
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



