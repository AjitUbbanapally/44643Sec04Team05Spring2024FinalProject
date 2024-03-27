//
//  MatterVC.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 07/03/24.
//

import UIKit

class MatterVC: UIViewController {
    
    
    @IBOutlet weak var ClientTableView: UITableView!
    
    var client  = ["Matter1","Matter2","Matter3","Matter4"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ClientTableView.delegate = self
      //  ClientTableView.dataSource = self
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



