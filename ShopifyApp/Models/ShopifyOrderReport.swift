//
//  ShopifyOrderReport.swift
//  ShopifyApp
//
//  Created by Sebastian Kolosa on 2017-09-19.
//  Copyright © 2017 SebastianKolosa. All rights reserved.
//

import Foundation
import SwiftyJSON

class ShopifyOrderReport {
  let totalSpending: Double
  let awesomeBronzeBagCount: Int
  
  init(totalSpending: Double, awesomeBronzeBagCount: Int) {
    self.totalSpending = totalSpending
    self.awesomeBronzeBagCount = awesomeBronzeBagCount
  }
}
