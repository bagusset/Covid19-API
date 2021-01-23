//
//  ReportDataCovidCell.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 21/01/21.
//

import UIKit

class ReportDataCovidCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var UIBackground: UIView!
    
    private var urlString : String = ""
    
    func setCellValueOfConfirmed(_ countriesData: countries) {
        updateUI(country: countriesData.Country, status: "Total Confirmed :", desc: countriesData.TotalConfirmed)
    }
    
    func setCellValueOfRecovered(_ countriesData: countries) {
        updateUI(country: countriesData.Country, status: "Total Recovered :", desc: countriesData.TotalRecovered)
    }
    
    func setCellValueOfDeaths(_ countriesData: countries) {
        updateUI(country: countriesData.Country, status: "Total Deaths :", desc: countriesData.TotalDeaths)
    }
    
    private func updateUI( country: String? , status : String, desc : Int?) {
        self.countryLabel.text = country
        self.statusLabel.text = status
        self.descriptionLabel.text = String(desc!)
        self.UIBackground.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
