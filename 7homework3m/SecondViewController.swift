//
//  SecondViewController.swift
//  7homework3m
//
//  Created by mavlyuda on 29/3/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    
    private var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
    }

    func initData(){
        data.addCompany(name: "Apple", address: "Broadway St. 123", mobileNumber: "+1122334455")
        data.addCompany(name: "Samsung", address: "Broadway St. 124", mobileNumber: "+1122334454")
        data.addCompany(name: "Sony", address: "Broadway St. 125", mobileNumber: "+1122334453")
        data.addCompany(name: "Panasonic", address: "Broadway St. 126", mobileNumber: "+1122334452")
        data.addCompany(name: "Apple", address: "Broadway St. 123", mobileNumber: "+1122334455")
        data.addCompany(name: "Samsung", address: "Broadway St. 124", mobileNumber: "+1122334454")
        data.addCompany(name: "Sony", address: "Broadway St. 125", mobileNumber: "+1122334453")
        data.addCompany(name: "Panasonic", address: "Broadway St. 126", mobileNumber: "+1122334452")
        data.addCompany(name: "Apple", address: "Broadway St. 123", mobileNumber: "+1122334455")
        data.addCompany(name: "Samsung", address: "Broadway St. 124", mobileNumber: "+1122334454")
        data.addCompany(name: "Sony", address: "Broadway St. 125", mobileNumber: "+1122334453")
        data.addCompany(name: "Panasonic", address: "Broadway St. 126", mobileNumber: "+1122334452")
        
        tableView.reloadData()
    }
    
    private func initUI(){
        view.backgroundColor = .white
        
        let backLabel: UILabel = {
            let view = UILabel()
            view.text = "Back"
            view.font = .systemFont(ofSize: 15, weight: .medium)
            return view
        }()
        
        view.addSubview(backLabel)
        
        backLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(19)
        }
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(backLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(40.5)
        }
        
        searchBar.placeholder = "Jl. Merah Biru Nomor 123"
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: "cell2")
        
        let strokeView: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            return view
        }()
        
        let middleLabel: UILabel = {
            let view = UILabel()
            view.text = "Or select via map?"
            view.font = .systemFont(ofSize: 13, weight: .bold)
            view.textColor = UIColor(red: 36/255, green: 78/255, blue: 185/255, alpha: 1)
            return view
        }()
        
        let strokeView2: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            view.layer.opacity = 0.4
            return view
        }()
        
        view.addSubview(middleLabel)
        middleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(strokeView)
        strokeView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalTo(middleLabel)
            make.left.equalToSuperview().offset(19)
            make.right.equalTo(middleLabel.snp.left).offset(-11)
        }
        
        view.addSubview(strokeView2)
        strokeView2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalTo(middleLabel)
            make.left.equalTo(middleLabel.snp.right).offset(11)
            make.right.equalToSuperview().offset(-19)
        }
        
        let doneButton: UIButton = {
            let view = UIButton()
            view.backgroundColor = UIColor(red: 36/255, green: 78/255, blue: 185/255, alpha: 1)
            view.setTitleColor(.white, for: .normal)
            view.setTitle("Done", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            view.layer.cornerRadius = 22
            return view
        }()
        
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.left.right.equalToSuperview().inset(19)
            make.height.equalTo(45)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(middleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(doneButton.snp.top).offset(-19)
        }
    }

}

extension SecondViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data.setArray(text: searchText.lowercased())
        tableView.reloadData()
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SecondCustomCell
        let current = data.getModel(index: indexPath.row)
        cell.fillCell(name: current.name, address: current.address)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }

}
