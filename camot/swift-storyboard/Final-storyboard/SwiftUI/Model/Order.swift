//
//  Order.swift
//  Final
//
//  Created by error on 2020/11/30.
//

import Foundation
class Order:Identifiable{
    private var orderDate = ""
    private var deliveryDate = ""
    private var orderNumber = ""
    private var fullName = ""
    private var address = ""
    
    var id = UUID()
    init(_fullname:String,_address:String,_orderDate:String,_orderNumber:String,_deliveryDate:String){
        setFullName(_fullName: _fullname)
        setAddress(_address: _address)
        setOrderDate(_orderdate: _orderDate)
        setOrderNumber(_orderNumber: _orderNumber)
        setDeliveryDate(_deliveryDate: _deliveryDate)
    }
    
    //order date
    func setOrderDate(_orderdate:String){
        self.orderDate = _orderdate
    }
    func getOrderDate() -> String{
        orderDate
    }
    
    //delivery date
    func setDeliveryDate(_deliveryDate:String){
        self.deliveryDate = _deliveryDate
    }
    func getDeliveryDate() -> String{
        deliveryDate
    }
    
    //order number
    func setOrderNumber(_orderNumber:String){
        self.orderNumber = _orderNumber
    }
    func getOrderNumber() -> String{
        orderNumber
    }
    //address
    func setAddress(_address:String){
        self.address = _address
    }
    func getAddress() -> String{
        address
    }
    
    //full name
    func setFullName(_fullName:String){
        self.fullName = _fullName
    }
    func getFullName() -> String{
        fullName
    }
}
