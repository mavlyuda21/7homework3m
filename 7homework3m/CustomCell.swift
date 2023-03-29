//
//  CustomCell.swift
//  7homework3m
//
//  Created by mavlyuda on 26/3/23.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 36/255, green: 78/255, blue: 185/255, alpha: 1)
        return view
    }()
    
    private let dotImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ellipsis")
        view.tintColor = .white
        return view
    }()
    
    private let numberLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.font = .systemFont(ofSize: 13, weight: .bold)
        view.layer.cornerRadius = 13
        view.textAlignment = .center
        view.text = "C0015"
        view.textColor = UIColor(red: 36/255, green: 78/255, blue: 185/255, alpha: 1)
        view.clipsToBounds = true
        return view
    }()
    
    private let topMailImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "email")
        return view
    }()
    
    private let middleMailImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "email")
        return view
    }()
    
    private let bottomMailImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "email")
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Apple Inc."
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textColor = UIColor(red: 36/255, green: 78/255, blue: 185/255, alpha: 1)
        return view
    }()
    
    private let addressLabel: UILabel = {
        let view = UILabel()
        view.text = "Broadway St. 128"
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    private let emailLabel: UILabel = {
        let view = UILabel()
        view.text = "apple@apple.com"
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    private let mobileNumberLabel: UILabel = {
        let view = UILabel()
        view.text = "+131222211122"
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        contentView.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        mainView.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.height.equalTo(39.25)
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
        }

        topView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6.7)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(25.85)
            make.width.equalTo(66)
        }

        topView.addSubview(dotImage)
        dotImage.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(4)
            make.centerY.equalTo(numberLabel)
            make.right.equalToSuperview().inset(10)
        }
        
        mainView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(39.25)
        }
        
        mainView.addSubview(topMailImage)
        topMailImage.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.width.height.equalTo(11)
            make.top.equalTo(nameLabel.snp.bottom)
        }
        
        mainView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.centerY.equalTo(topMailImage)
            make.left.equalTo(topMailImage.snp.right).offset(10)
        }
        
        mainView.addSubview(middleMailImage)
        middleMailImage.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.width.height.equalTo(11)
            make.top.equalTo(topMailImage.snp.bottom).offset(15.8)
        }
        
        mainView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(middleMailImage)
            make.leading.equalTo(addressLabel)
        }
        
        mainView.addSubview(bottomMailImage)
        bottomMailImage.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.width.height.equalTo(11)
            make.top.equalTo(middleMailImage.snp.bottom).offset(15.8)
        }
        
        mainView.addSubview(mobileNumberLabel)
        mobileNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bottomMailImage)
            make.leading.equalTo(addressLabel)
        }
        
    }
    
    func fillCell(number: String, name: String, address: String, mobileNumber: String){
        numberLabel.text = number
        nameLabel.text = name
        addressLabel.text = address
        mobileNumberLabel.text = mobileNumber
    }

}
