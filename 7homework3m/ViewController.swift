//
//  ViewController.swift
//  7homework3m
//
//  Created by mavlyuda on 29/3/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    
    private var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initUI()
    }
    
    private func initData(){
        data.addCompany(name: "Apple", address: "Broadway St. 123", mobileNumber: "+1122334455")
        data.addCompany(name: "Samsung", address: "Broadway St. 124", mobileNumber: "+1122334454")
        data.addCompany(name: "Sony", address: "Broadway St. 125", mobileNumber: "+1122334453")
        data.addCompany(name: "Panasonic", address: "Broadway St. 126", mobileNumber: "+1122334452")
        tableView.reloadData()
    }

    private func initUI(){
        view.backgroundColor = .white
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search here"
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }

}

extension MainViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data.setArray(text: searchText.lowercased())
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let current = data.getModel(index: indexPath.section)
        cell.fillCell(number: "C00\(indexPath.section + 1)", name: current.name, address: current.address, mobileNumber: current.mobileNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 16
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }
    
}
