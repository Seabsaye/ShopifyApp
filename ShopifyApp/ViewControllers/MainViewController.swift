//
//  ViewController.swift
//  ShopifyApp
//
//  Created by Sebastian Kolosa on 2017-09-19.
//  Copyright © 2017 SebastianKolosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var orderReportView: OrderReportView!
  @IBOutlet weak var getOrderReportButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupGetOrderReportButton()
  }
  
  @IBAction func getOrderReportButtonClicked(_ sender: Any) {
    getOrderReportButton.isEnabled = false
    
    orderReportView.totalSpendingLabel.text = ""
    orderReportView.totalSpendingActivityIndicator.startAnimating()
    
    orderReportView.awesomeBronzeBagCountLabel.text = ""
    orderReportView.awesomeBronzeBagCountActivityIndicator.startAnimating()
    
    DataManager.GETShopifyOrderReport { shopifyOrderReport in
      self.getOrderReportButton.isEnabled = true
      self.orderReportView.totalSpendingLabel.text = "$\(shopifyOrderReport.totalSpending) CAD"
      self.orderReportView.totalSpendingActivityIndicator.stopAnimating()
      self.orderReportView.awesomeBronzeBagCountLabel.text = "\(shopifyOrderReport.awesomeBronzeBagCount)"
      self.orderReportView.awesomeBronzeBagCountActivityIndicator.stopAnimating()
    }
  }
  
  //MARK: - helpers
  private func setupGetOrderReportButton() {
    getOrderReportButton.layer.cornerRadius = 5.0
    getOrderReportButton.setTitleColor(.gray, for: .disabled)
  }
}
