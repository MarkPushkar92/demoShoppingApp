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
    
    func fetchDetails(completionHandler: @escaping (ProductDetails) -> Void) {
        
        let urlString = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let parsedData = self.parseDetails(withData: data) {
                completionHandler(parsedData)
            }
        }
        
        task.resume()
    }
    
    private func parseDetails(withData data: Data) -> ProductDetails? {
        let decoder = JSONDecoder()
        do {
            let productList = try decoder.decode(ProductDetails.self, from: data)
            return productList
        } catch let error as NSError {
            print(error.localizedDescription)
            print("parsing error")
        }
        return nil
    }
    
    func fetchBusket(completionHandler: @escaping (BasketContainer) -> Void) {
        
        let urlString = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            if let parsedData = self.parseBasket(withData: data) {
                completionHandler(parsedData)
            }
        }
        
        task.resume()
    }
    
    private func parseBasket(withData data: Data) -> BasketContainer? {
        let decoder = JSONDecoder()
        do {
            let productList = try decoder.decode(BasketContainer.self, from: data)
            return productList
        } catch let error as NSError {
            print(error.localizedDescription)
            print("parsing error")
        }
        return nil
    }
    
    
}
