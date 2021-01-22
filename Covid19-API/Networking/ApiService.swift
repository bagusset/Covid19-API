//
//  ApiService.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 21/01/21.
//

import Foundation

class ApiService {
    
    private var dataTask : URLSessionTask?
    
    func getDataReportCovid19(completion: @escaping (Result<covid19Data, Error>) -> Void) {
        
        let covidDataUrl = "https://api.covid19api.com/summary"
        
        guard let url = URL(string: covidDataUrl) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, respone, eror) in
            if let eror = eror {
                completion(.failure(eror))
                print("dataTask eror : \(eror.localizedDescription)")
                return
            }
            
            guard let respone = respone as? HTTPURLResponse else {
                print("Empty response")
                return
            }
            
            print("response status code : \(respone.statusCode)")
            
            guard let data = data else {
                print("Empty data")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(covid19Data.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
                
            } catch let eror {
                completion(.failure(eror))
            }
        }
        dataTask?.resume()
    }
    
}

