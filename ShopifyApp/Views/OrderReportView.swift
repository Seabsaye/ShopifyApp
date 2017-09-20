//
//  OrderReportView.swift
//  ShopifyApp
//
//  Created by Sebastian Kolosa on 2017-09-19.
//  Copyright © 2017 SebastianKolosa. All rights reserved.
//

import Foundation
import UIKit

class OrderReportView: NibLoadingView {
  @IBOutlet weak var totalSpendingLabel: UILabel!
  @IBOutlet weak var totalSpendingActivityIndicator: UIActivityIndicatorView!

  @IBOutlet weak var awesomeBronzeBagCountLabel: UILabel!
  @IBOutlet weak var awesomeBronzeBagCountActivityIndicator: UIActivityIndicatorView!
}
