//
//  ViewController.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 20/01/21.
//

import UIKit

class ReportDataCovidVC: UIViewController {
    
    
    @IBOutlet weak var reportDataTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalCountryLabel: UILabel!
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    
    private var viewModel = CovidDataViewModels()
    var getDataCountry : countries!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        //loadd()
        dateLabel.text = getDataCountry?.Date
       
    }
    
    @IBAction func statusSegmentedPressed(_ sender: Any) {
        reportDataTableView.reloadData()
    }
    
    
    
    private func loadData(){
        viewModel.fecthDataCountry { [weak self] in
            self?.reportDataTableView.reloadData()
            self?.reportDataTableView.dataSource = self
        }
       
    }
    
    
    
    func setGlobalValue(_ countriesData : countries){
        getDataGlobal(date: countriesData.Date)

    }

    func getDataGlobal(date : String?){
        self.dateLabel.text = convertedDateFormater(date)
        //self.totalCountryLabel.text = totalCountry
    }
    
    func convertedDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormater.date(from: originalDate) {
                dateFormater.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormater.string(from: newDate)
            }
        }
        return fixDate
    }
    
 
    
}

extension ReportDataCovidVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReportDataCovidCell
        
        let dataCovid = viewModel.cellForRowAt(indexPath: indexPath)
        
        if statusSegmentedControl.selectedSegmentIndex == 0 {
            cell.setCellValueOfConfirmed(dataCovid)
        } else if statusSegmentedControl.selectedSegmentIndex == 1 {
            cell.setCellValueOfRecovered(dataCovid)
        } else if statusSegmentedControl.selectedSegmentIndex == 2{
            cell.setCellValueOfDeaths(dataCovid)
        }
       
        return cell
        
    }
    
    
    
    
}
