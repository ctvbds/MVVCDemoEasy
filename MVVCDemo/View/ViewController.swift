//
//  ViewController.swift
//  MVVCDemo
//
//  Created by CuongK on 7/16/18.
//  Copyright © 2018 CuongK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView:UITableView!
    static var cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let products = [ // model
            Product(name: "Keyboard", price: 6),
            Product(name: "Mouse", price: 5)
        ]
        
        let viewModel = ListViewModel(products: products)
        self.viewModel = viewModel
        
        self.tableView = UITableView.init(frame: self.view.frame)
        self.tableView.backgroundColor = .red
        self.view.addSubview(self.tableView)
        self.tableView.register(ProductCell.self, forCellReuseIdentifier: ViewController.cellID)

        viewModel.showProductList()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    var viewModel: ListViewModelProtocol! {
        didSet {
            self.viewModel.productDidChange = { [unowned self] viewModel in
                self.tableView.dataSource = self.viewModel.productListDataSource
                self.tableView.reloadData()
            }
        }
    }


}

