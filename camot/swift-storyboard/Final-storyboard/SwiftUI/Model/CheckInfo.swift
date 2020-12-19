//
//  CheckInfo.swift
//  Final
//
//  Created by error on 2020/11/30.
//

import Foundation
class CheckInfo{
    private var firstname = ""
    private var lastname = ""
    private var address1 = ""
    private var address2 = ""
    private var city = ""
    private var state = ""
    private var zipCode = ""
    
    init(firstname:String,lastname:String,address1:String,address2:String,city:String,state:String,zipcode:String){
        setFirstname(_firstname: firstname)
        setLastname(_lastname: lastname)
        setAddress1(_address1: address1)
        setAddress2(_address2: address2)
        setCity(_city: city)
        setState(_state: state)
        setZipcode(_zipcode: zipcode)
    }
    
    //first name
    func setFirstname(_firstname:String){
        self.firstname = _firstname
    }
    func getFirstname() -> String{
        firstname
    }
    //last name
    func setLastname(_lastname:String){
        self.lastname = _lastname
    }
    func getLastname() -> String{
        lastname
    }
    //address 1
    func setAddress1(_address1:String){
        self.address1 = _address1
    }
    func getAddress1() -> String{
        address1
    }
    //address 2
    func setAddress2(_address2:String){
        self.address2 = _address2
    }
    func getAddress2() -> String{
        address2
    }
    //city
    func setCity(_city:String){
        self.city = _city
    }
    func getCity() -> String{
        city
    }
    //state
    func setState(_state:String){
        self.state = _state
    }
    func getState() -> String{
        state
    }
    //zip code
    func setZipcode(_zipcode:String){
        self.zipCode = _zipcode
    }
    func getZipcode() -> String{
        zipCode
    }
}
