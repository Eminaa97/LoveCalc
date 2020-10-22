//
//  CalcRequest.swift
//  LoveCalc
//
//  Created by Emina Mesic on 21/10/2020.
//

import Foundation

enum CalcError :Error {
    case noDataAvailable
    case canNotProcessData
}


struct CalcRequest{

    var request: URLRequest
    
    init(fname:String,sname:String) {
        let resourceString = "https://rapidapi.p.rapidapi.com/getPercentage?fname=\(fname)&sname=\(sname)"
        
        guard let resourceURL = URL(string: resourceString) else { fatalError()}
        request = URLRequest(url: resourceURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Accept")
        request.setValue("love-calculator.p.rapidapi.com", forHTTPHeaderField:"x-rapidapi-host")
        request.setValue("cbb63b0f63mshad4888a96e736b9p18190djsnce06f2cb5581", forHTTPHeaderField:"x-rapidapi-key")
        request.timeoutInterval = 10.0
    }
    
    func getPercentage (completion: @escaping(Result<CalcResponse, CalcError>)-> Void){
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler:{
            (data, response, error) -> Void in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
                if (error != nil) {
                    print(error as Any)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse!)
                    do{
                        let decoder = JSONDecoder()
                        let Response = try decoder.decode(CalcResponse.self, from: jsonData)
                        completion(.success(Response))
                        print(Response)
                    }catch{
                        completion(.failure(.canNotProcessData))
                    }
                }
            })

            dataTask.resume()
    }
}
