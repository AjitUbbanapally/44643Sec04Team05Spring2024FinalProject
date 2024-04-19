
import UIKit
import AVFoundation

class MatterListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noData: UILabel!

    var caseData: [CaseDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        setupMenuButton()
    }
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func menuButtonTapped() {
        guard let splitViewController = splitViewController else { return }
        SplitViewControllerUtility.toggleMasterView(for: splitViewController)
        AudioServicesPlaySystemSound(SystemSoundID(1105))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = caseData[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "MatterDetailVC" ) as! MatterDetailVC
        vc.caseData = data
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
}

extension MatterListVC {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            // Create a swipe action for deletion
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
                let caseDetail = self.caseData[indexPath.row]
                
                // Delete the case detail from Firestore
                FireStoreManager.shared.deleteCaseDetail(caseDetail) { success in
                    if success {
                        self.caseData.remove(at: indexPath.row)
                        
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                        
                        completionHandler(true)
                    } else {
                        print("Error deleting case detail from Firestore")
                        completionHandler(false)
                    }
                }
            }
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
        }
}

