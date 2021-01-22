//
//  CovidDataViewModels.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 21/01/21.
//

import Foundation


class CovidDataViewModels{
    
    private var appServices = ApiService()
    private var getDataCountry = [countries]()
    
    func fecthDataCountry (completion: @escaping () -> ()) {
        appServices.getDataReportCovid19 { [weak self](countries) in
            switch countries{
            case .success(let listOf):
                self?.getDataCountry = listOf.Countries
                completion()
            case .failure(let eror):
                print("Eror prosesing json data : \(eror)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if getDataCountry.count != 0 {
            return getDataCountry.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> countries {
        return getDataCountry[indexPath.row]
    }
}
