

import UIKit

class ReportVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            Text("Welcome to Your Dashboard")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            Button(action: {
                // Action for button 1
            }) {
                Text("Button 1")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                // Action for button 2
            }) {
                Text("Button 2")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        DashboardView()
    }
}

