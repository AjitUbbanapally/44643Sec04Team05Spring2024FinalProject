//
//  PartyVC.swift
//  LegalCaseManagementSystem
//
//  Created by ajit hk on 07/03/24.
//

import UIKit

class PartyVC: UIViewController {

    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var detailsOfselection: UILabel!
    @IBOutlet weak var aliasName: UILabel!
    @IBOutlet weak var caseType: UILabel!
    @IBOutlet weak var partyName: UILabel!
  
    override func viewDidLoad() {
            super.viewDidLoad()

            // Set initial values for the labels
            detailsOfselection.text = "Details of Selection"
            aliasName.text = "Alias Name"
            caseType.text = "Case Type"
            partyName.text = "Party Name"

            // Customize the appearance of the search button
            search.setTitle("Search", for: .normal)
            search.setTitleColor(.white, for: .normal)
            search.backgroundColor = .systemBlue
            search.layer.cornerRadius = 8
            search.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        }

        @objc func searchButtonTapped() {
            // Handle search button tap event
            print("Search button tapped!")
            // Perform search functionality or navigate to a search screen
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
