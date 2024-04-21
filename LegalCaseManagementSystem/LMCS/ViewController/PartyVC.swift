
import UIKit
import AVFoundation

class PartyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noData: UILabel!

    var partyData: [PartyDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        FireStoreManager.shared.fetchPartyDetails { partyDetail in
            self.partyData = partyDetail
            self.tableView.isHidden = true
            self.noData.text = "No Party Record Found"

            self.tableView.isHidden = self.partyData.count != 0 ? false : true
            self.noData.isHidden = self.partyData.count != 0 ? true : false

            print(self.partyData)
            
            self.tableView.reloadData()
        }
    }
    
}

extension PartyVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let partyData = partyData[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PartyTableViewCell
        
        cell.setData(numberOfConvictedFeloniesTxt: String(partyData.numberOfConvictedFelonies), partyNameTxt: partyData.partyName, emailTxt: partyData.userEmail)
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = partyData[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "PartyDetailVC" ) as! PartyDetailVC
        vc.partyData = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
