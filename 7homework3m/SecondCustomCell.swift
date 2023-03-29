//
//  SecondCustomCell.swift
//  7homework3m
//
//  Created by mavlyuda on 29/3/23.
//

import UIKit
import SnapKit

class SecondCustomCell: UITableViewCell {

    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Apple Inc."
        view.font = .systemFont(ofSize: 13, weight: .bold)
        return view
    }()
    
    private let addressLabel: UILabel = {
        let view = UILabel()
        view.text = "Broadway St. 128"
        view.font = .systemFont(ofSize: 12, weight: .regular)
        return view
    }()
    
    private let strokeView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.opacity = 0.4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(19)
            make.top.equalToSuperview().offset(12)
        }
        
        mainView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(19)
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
        }
        
        mainView.addSubview(strokeView)
        strokeView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(19)
            make.right.equalToSuperview()
            make.top.equalTo(addressLabel.snp.bottom).offset(8)
        }
        
    }
    
    func fillCell(name: String, address: String){
        nameLabel.text = name
        addressLabel.text = address
    }

}
