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
            cell.descriptionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.countryLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.statusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.UIBackground.backgroundColor = #colorLiteral(red: 1, green: 0.9545326829, blue: 0.5062153935, alpha: 1)
            cell.UIBackground.layer.cornerRadius = 10
        } else if statusSegmentedControl.selectedSegmentIndex == 1 {
            cell.setCellValueOfRecovered(dataCovid)
            cell.descriptionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.countryLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.statusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.UIBackground.backgroundColor = #colorLiteral(red: 0.5250641108, green: 1, blue: 0.6824213266, alpha: 1)
            cell.UIBackground.layer.cornerRadius = 10
        } else if statusSegmentedControl.selectedSegmentIndex == 2{
            cell.setCellValueOfDeaths(dataCovid)
            cell.descriptionLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.countryLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.statusLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.UIBackground.backgroundColor = #colorLiteral(red: 1, green: 0.3413342834, blue: 0, alpha: 1)
            cell.UIBackground.layer.cornerRadius = 10
        }
        
        return cell
        
    }
    
}
