//
//  ListViewController.swift
//  MVVCDemo
//
//  Created by CuongK on 7/16/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    var viewModel: ListViewModelProtocol! {
        didSet {
            self.viewModel.productDidChange = { [unowned self] viewModel in
                self.tableView.dataSource = self.viewModel.productListDataSource
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.showProductList()
    }
}
