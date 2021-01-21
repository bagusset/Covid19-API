//
//  ViewController.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 20/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var apiServices = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiServices.getDataReportCovid19 { (Countries) in
            print(Countries)
        }
        // Do any additional setup after loading the view.
    }


}

