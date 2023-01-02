//
//  NetworkService.swift
//  demoShoppingApp
//
//  Created by Марк Пушкарь on 29.12.2022.
//

import Foundation

struct NetworkService {
    
    func fetchData(completionHandler: @escaping (Allproducts) -> Void) {
        
        let urlString = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let parsedData = self.parseJSON(withData: data) {
                completionHandler(parsedData)
            }
        }
        
        task.resume()
    }
    
    private func parseJSON(withData data: Data) -> Allproducts? {
        let decoder = JSONDecoder()
        do {
            let productList = try decoder.decode(Allproducts.self, from: data)
            return productList
        } catch let error as NSError {
            print(error.localizedDescription)
            print("parsing error")
        }
        return nil
    }
    
}
