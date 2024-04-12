

import UIKit

class MatterListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noData: UILabel!

    var caseData: [CaseDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FireStoreManager.shared.fetchCaseDetails { caseDetail in
            self.caseData = caseDetail
            self.tableView.isHidden = true
            self.noData.text = "No Case Matter Found"

            self.tableView.isHidden = self.caseData.count != 0 ? false : true
            self.noData.isHidden = self.caseData.count != 0 ? true : false

            print(self.caseData)
            
            self.tableView.reloadData()
        }
    }
    

    @IBAction func onCreateMatter(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "CreateMatterVC" ) as! CreateMatterVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension MatterListVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return caseData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let caseData = caseData[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.setData(matterIdTxt: caseData.matterId, caseTitleTxt: caseData.caseTitle, partyNameTxt: caseData.partyName, caseTypeTxt: caseData.caseType, matterValueTxt: caseData.matterValue, dateOfIncidentTxt: caseData.dateOfIncident)
        
        return cell
    }

}
