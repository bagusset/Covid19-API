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
    
    private var urlString : String = ""
    
    func setCellValueOf(_ countriesData: countries) {
        updateUI(country: countriesData.Country, status: "Confirmed", desc: countriesData.TotalConfirmed)
    }
    
    private func updateUI( country: String? , status : String, desc : Int?) {
        self.countryLabel.text = country
        self.statusLabel.text = status
        self.descriptionLabel.text = String(desc!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
