//
//  DataManager.swift
//  ShopifyApp
//
//  Created by Sebastian Kolosa on 2017-09-19.
//  Copyright © 2017 SebastianKolosa. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class DataManager {
  private init() {}
  
  static let sharedInstance = DataManager()
  
  private static let baseUrl = "https://shopicruit.myshopify.com"
  
  private enum EndpointUrl: String {
    case getOrders = "/admin/orders.json"
  }
  
  typealias JSONRequestCompletion = (JSON) -> Void
  
  static func GETRequest(url: URLConvertible, parameters: Parameters, completion: @escaping JSONRequestCompletion) {
    Alamofire.request(url, parameters: parameters).responseJSON { response in
      guard response.result.isSuccess else {
        print("Error retrieving data from GET request with url: \(url).")
        completion(JSON())
        return
      }
      guard let responseData = response.result.value else {
          print("Error parsing GET request response into JSON from url: \(url)")
          completion(JSON())
          return
      }
      let responseJSON = JSON(responseData)
      completion(responseJSON)
    }
  }
  
  static func GETShopifyOrderReport(completion: @escaping (ShopifyOrderReport) -> ()) {
    let url = "\(baseUrl)\(EndpointUrl.getOrders.rawValue)"
    let parameters = ["page": "1", "access_token": "c32313df0d0ef512ca64d5b336a0d7c6"]
    
    self.GETRequest(url: url, parameters: parameters) { JSON in
      guard !JSON.isEmpty else {
        completion(ShopifyOrderReport(totalSpending: 0.0, awesomeBronzeBagCount: 0))
        return
      }
      if let orders = JSON["orders"].array {
        var totalSpending: Double = 0
        var awesomeBronzeBagCount: Int = 0
        for order in orders {
          if let email = order["email"].string {
            /* Napoleon Batz is distinguished by his email
               as a safe measure, as email likely cannot be
               changed while first_name and last_name perhaps
               can be.
             */
            if email == "napoleon.batz@gmail.com" {
              if let currency = order["currency"].string {
                if currency == "CAD" {
                  if let totalPrice = order["total_price"].string {
                    if let totalPrice = Double(totalPrice) {
                      totalSpending += totalPrice
                    }
                  }
                }
              }
            }
          }
          if let lineItems = order["line_items"].array {
            for lineItem in lineItems {
              if let title = lineItem["title"].string {
                if title == "Awesome Bronze Bag" {
                  if let quantity = lineItem["quantity"].int {
                    awesomeBronzeBagCount += quantity
                  }
                }
              }
            }
          }
        }
        completion(ShopifyOrderReport(totalSpending: totalSpending, awesomeBronzeBagCount: awesomeBronzeBagCount))
      }
    }
  }
}
