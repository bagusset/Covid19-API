//
//  ViewController.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 20/01/21.
//

import UIKit

class ReportDataCovidVC: UIViewController {
    
    
    @IBOutlet weak var reportDataTableView: UITableView!
    
    private var viewModel = CovidDataViewModels()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData(){
        viewModel.fecthDataCountry { [weak self] in
            self?.reportDataTableView.reloadData()
            self?.reportDataTableView.dataSource = self
        }
    }
}

extension ReportDataCovidVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReportDataCovidCell
        
        let dataCovid = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellValueOf(dataCovid)
        return cell
        
    }
    
    
    
    
}
