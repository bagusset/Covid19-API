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
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    
    private var viewModel = CovidDataViewModels()
    var getDataCountry : countries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        dates()
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
    func dates(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateLabel.text = dateFormatter.string(from: date)
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
            cell.descriptionLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        } else if statusSegmentedControl.selectedSegmentIndex == 1 {
            cell.setCellValueOfRecovered(dataCovid)
            cell.descriptionLabel.textColor = #colorLiteral(red: 0.007044891827, green: 0.885907352, blue: 0.1369796097, alpha: 1)
        } else if statusSegmentedControl.selectedSegmentIndex == 2{
            cell.setCellValueOfDeaths(dataCovid)
            cell.descriptionLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        
        return cell
        
    }
    
}
