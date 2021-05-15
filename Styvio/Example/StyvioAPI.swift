//
//  StyvioAPI.swift
//  Styvio
//
//  Created by Jared Cassoutt on 5/15/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

class StyvioAPI {
    
    func fetchStockInformation(stockName: String, success: @escaping(_ data:StockInformation)->(),failure:@escaping (_ error:Error)->()) {
        let urlString = "https://www.styvio.com/api/\(stockName)"
        print(urlString)
        //create a url
        if let url = URL(string: urlString) {
            //create URLSession
            let session = URLSession(configuration: .default)
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                if let safeData = data {
                    
                    let jsonString = String(data: safeData, encoding: String.Encoding.utf8)
                    let parsed = jsonString!.replacingOccurrences(of: ", NaN", with: "")
                    let jsonData = Data(parsed.utf8)
                    
                    //print(String(data: jsonData, encoding: String.Encoding.utf8))
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(StockInformation.self, from: jsonData)
                        print(decodedData)
                        success(decodedData)
                    }
                    catch {
                        print(error)
                        failure(error)
                    }
                }
            }
            //Start task
            task.resume()
        }
    }
    
    func fetchSentimentInformation(stockName: String, success: @escaping(_ data:SentimentInformation)->(),failure:@escaping (_ error:Error)->()) {
        let urlString = "https://www.styvio.com/api/sentiment/\(stockName)"
        print(urlString)
        //create a url
        if let url = URL(string: urlString) {
            //create URLSession
            let session = URLSession(configuration: .default)
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                if let safeData = data {
                    
                    let jsonString = String(data: safeData, encoding: String.Encoding.utf8)
                    let parsed = jsonString!.replacingOccurrences(of: ", NaN", with: "")
                    let jsonData = Data(parsed.utf8)
                    
                    //print(String(data: jsonData, encoding: String.Encoding.utf8))
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(SentimentInformation.self, from: jsonData)
                        print(decodedData)
                        success(decodedData)
                    }
                    catch {
                        print(error)
                        failure(error)
                    }
                }
            }
            //Start task
            task.resume()
        }
    }
    
}

