import UIKit
import DGCharts

class ReportVC: UIViewController {
    
    var numberOfPartyRegistered = 12
    var numberOfCasesTaken = 4
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuButton()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
         
        FireStoreManager.shared.fetchPartyDetails { parties in
            self.numberOfPartyRegistered = parties.count
            self.showChart()
        }
        
        FireStoreManager.shared.fetchCaseDetails(completion:{ cases in
            self.numberOfPartyRegistered = cases.count
            self.showChart()
        })
    }
    
    func showChart() {
        // Pie Chart
        let pieEntries = [
            PieChartDataEntry(value: Double(numberOfPartyRegistered), label: "Party Added"),
            PieChartDataEntry(value: Double(numberOfCasesTaken), label: "Cases ")
        ]
        let pieChartDataSet = PieChartDataSet(entries: pieEntries)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        // Additional styling for pie chart
        pieChartDataSet.colors = ChartColorTemplates.joyful()
        
        // Bar Chart
        let barEntries = [
            BarChartDataEntry(x: 0, y: Double(numberOfPartyRegistered)),
            BarChartDataEntry(x: 1, y: Double(numberOfCasesTaken))
        ]
        let barChartDataSet = BarChartDataSet(entries: barEntries)
        let barChartData = BarChartData(dataSet: barChartDataSet)
        barChartView.data = barChartData
        
        // Additional styling for bar chart
        barChartDataSet.colors = ChartColorTemplates.material()
        let xAxis = barChartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Party", "Cases"])
    }
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func menuButtonTapped() {
        guard let splitViewController = splitViewController else { return }
        SplitViewControllerUtility.toggleMasterView(for: splitViewController)
    }
}
