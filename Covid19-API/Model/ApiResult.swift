//
//  ApiResult.swift
//  Covid19-API
//
//  Created by Bagus setiawan on 21/01/21.
//

import Foundation

struct covid19Data : Decodable {
   
    let Global : global
    let Countries : [countries]
    
    private enum CodingKeys: String, CodingKey{
        case Global = "Global"
        case Countries = "Countries"
    }
}

struct global : Decodable {
    
    let NewConfirmed : Int?
    let TotalConfirmed : Int?
    let NewDeaths : Int?
    let TotalDeaths : Int?
    let NewRecovered : Int?
    let TotalRecovered : Int?
    
    private enum CodingKeys: String, CodingKey{
        case NewConfirmed = "NewConfirmed"
        case TotalConfirmed = "TotalConfirmed"
        case NewDeaths = "NewDeaths"
        case TotalDeaths = "TotalDeaths"
        case NewRecovered = "NewRecovered"
        case TotalRecovered = "TotalRecovered"
           
    }
}

struct countries : Decodable {
    
    let Country : String?
    let CountryCode : String?
    let Slug : String?
    let NewConfirmed : Int?
    let TotalConfirmed : Int?
    let NewDeaths : Int?
    let TotalDeaths : Int?
    let NewRecovered : Int?
    let TotalRecovered : Int?
   
    
    private enum CodingKeys: String, CodingKey{
        case Country = "Country"
        case CountryCode = "CountryCode"
        case Slug = "Slug"
        case NewConfirmed = "NewConfirmed"
        case TotalConfirmed = "TotalConfirmed"
        case NewDeaths = "NewDeaths"
        case TotalDeaths = "TotalDeaths"
        case NewRecovered = "NewRecovered"
        case TotalRecovered = "TotalRecovered"
       
    }
}

