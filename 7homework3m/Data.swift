//
//  Data.swift
//  7homework3m
//
//  Created by mavlyuda on 29/3/23.
//

import Foundation

class Data{
    private var unsortedArray = [Company]()
    
    private var sortedArray = [Company]()
    
    private var count = 0
    
    private var sorting = false
    
    func setArray(text: String){
        if text.isEmpty {
            sortedArray = [Company]()
            sorting = false
        }else{
            sorting = true
            sortedArray = unsortedArray.filter({ $0.name.lowercased().contains(text) || $0.address.lowercased().contains(text) })
        }
    }
    
    func getCount() -> Int{
        if sorting == true{
            return sortedArray.count
        }else{return unsortedArray.count}
    }
    
    func getSorting() -> Bool{
        return sorting
    }
    
    func getModel(index: Int) -> Company{
        if sorting == true{
            return sortedArray[index]
        }else{
            return unsortedArray[index]
        }
    }
    
    func addCompany(name: String, address: String, mobileNumber: String){
        unsortedArray.append(Company(name: name, address: address, mobileNumber: mobileNumber))
    }
}

struct Company{
    
    var name: String, address: String, mobileNumber: String
}
