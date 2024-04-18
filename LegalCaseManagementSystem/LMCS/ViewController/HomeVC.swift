
import UIKit

enum ItemTitle: String {
    case Parties = "Parties"
    case Matters = "Matters"
    case Reports = "Reports"
    case ProfileScore = "Profile Score"
    case Settings = "Settings"
}

struct ImageTitleItem {
    var image: UIImage
    var title: ItemTitle
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var imageTitleArray: [ImageTitleItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let item1 = ImageTitleItem(image: UIImage(named: "party")!, title: .Parties)
        let item2 = ImageTitleItem(image: UIImage(named: "matters")!, title: .Matters)
        let item3 = ImageTitleItem(image: UIImage(named: "report")!, title: .Reports)
        let item4 = ImageTitleItem(image: UIImage(named: "score")!, title: .ProfileScore)
        let item5 = ImageTitleItem(image: UIImage(named: "setting")!, title: .Settings)

        imageTitleArray = [item1, item2, item3, item4, item5]
        
        let layout = CollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout

        collectionView.dataSource = self
        collectionView.delegate = self

    }

}


extension HomeVC: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageTitleArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell

        let item = imageTitleArray[indexPath.item]
        cell.imageview.image = item.image
        cell.textLable.text = item.title.rawValue

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = imageTitleArray[indexPath.item]

        switch item.title {
        case .Parties:
            let vc = self.storyboard?.instantiateViewController(withIdentifier:  "PartyVC" ) as! PartyVC
            self.navigationController?.pushViewController(vc, animated: true)
            print("")

        case .Matters:
            let vc = self.storyboard?.instantiateViewController(withIdentifier:  "MatterListVC" ) as! MatterListVC
            self.navigationController?.pushViewController(vc, animated: true)
            print("")

        case .Reports:
            let vc = self.storyboard?.instantiateViewController(withIdentifier:  "ReportVC" ) as! ReportVC
            self.navigationController?.pushViewController(vc, animated: true)

            print("")

        case .ProfileScore:
            let vc = self.storyboard?.instantiateViewController(withIdentifier:  "ProfileScoreVC" ) as! ProfileScoreVC
            self.navigationController?.pushViewController(vc, animated: true)


        case .Settings:
                        let vc = self.storyboard?.instantiateViewController(withIdentifier:  "SettingVC" ) as! SettingVC
                        self.navigationController?.pushViewController(vc, animated: true)

        }

    }
}

